import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RightButton extends StatelessWidget {
  ValueNotifier<GraphQLClient> clientRight = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://34.68.168.208:8003/graphql'),
    ),
  );

  String createdId = "";

  String query = """
    mutation{
      createMovement {
        _id
        status
        created
        updated
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return     GraphQLProvider(
        client: clientRight,
        child: CacheProvider(child: Mutation(
            options: MutationOptions(
              documentNode: gql(query),
              update: (Cache cache, QueryResult result) {
                return cache;
              },
              onCompleted: (dynamic resultData) {
                print(resultData);
              },
            ),
            builder: (RunMutation insert, QueryResult result) {
              return InkWell(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      color: Colors.white,
                      onPressed: () {
                        print("Insert Movement...");
                        insert(<String, dynamic>{"_id": createdId});
                      },
                      iconSize: 60.0,
                    )
                ),
                onTap: () {
                  print("Insert Movement...");
                  insert(<String, dynamic>{"_id": createdId});
                },
              );
            }))
    );
  }
}
