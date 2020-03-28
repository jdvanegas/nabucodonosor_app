import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ControlButtons extends StatelessWidget {
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
          return new Container(
            margin:
            const EdgeInsets.only(left: 60.0, right: 20.0, bottom: 50.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: new Container(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.expand_less),
                          color: Colors.white,
                          onPressed: () {
                            print("Insert Movement...");
                            insert(<String, dynamic>{"_id": createdId});
                          },
                          iconSize: 60.0,
                        ),
                      ),
                      onTap: () {
                        print("Insert Movement...");
                        insert(<String, dynamic>{"_id": createdId});
                      },
                    ),
                    InkWell(
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
                    )
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Row(
                      children: [
                        InkWell(
                            child: new Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              decoration: const ShapeDecoration(
                                color: Colors.lightBlue,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.chevron_left),
                                color: Colors.white,
                                onPressed: () {},
                                iconSize: 60.0,
                              ),
                            )
                        ),
                        InkWell(
                            child: new Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.chevron_right),
                                  color: Colors.white,
                                  onPressed: () {},
                                  iconSize: 60.0,
                                )
                            )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
