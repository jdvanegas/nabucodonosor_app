import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DownButton extends StatelessWidget {
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
    return Mutation(
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
              margin: const EdgeInsets.only(top: 20.0),
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.expand_more),
                color: Colors.white,
                onPressed: () {},
                iconSize: 60.0,
              ),
            ),
            onTap: () {
              print("Insert Movement...");
              insert(<String, dynamic>{"_id": createdId});
            },
          );
        });
  }
}
