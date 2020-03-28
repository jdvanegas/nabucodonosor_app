import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nabucodonosor_app/ControlButtons/DownButton.dart';
import 'package:nabucodonosor_app/ControlButtons/LeftButton.dart';
import 'package:nabucodonosor_app/ControlButtons/RightButton.dart';
import 'package:nabucodonosor_app/ControlButtons/UpButton.dart';

class ControlButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ValueNotifier<GraphQLClient> clientUp = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(uri: 'http://nabuco-up.eastus.azurecontainer.io:8000/graphql'),
      ),
    );

    ValueNotifier<GraphQLClient> clientLeft = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(uri: 'http://nabuco-left.eastus.azurecontainer.io:8000/graphql'),
      ),
    );

    ValueNotifier<GraphQLClient> clientRight = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(uri: 'http://nabuco-right.eastus.azurecontainer.io:8000/graphql'),
      ),
    );

    ValueNotifier<GraphQLClient> clientDown = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(uri: 'http://nabuco-down.eastus.azurecontainer.io:8000/graphql'),
      ),
    );

    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(left: 60.0, right: 20.0, bottom: 50.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GraphQLProvider(
                client: clientUp,
                child: CacheProvider(child: UpButton()),
              ),
              GraphQLProvider(
                client: clientDown,
                child: CacheProvider(child: DownButton()),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Row(
                children: [
                  GraphQLProvider(
                    client: clientLeft,
                    child: CacheProvider(child: LeftButton()),
                  ),
                  GraphQLProvider(
                    client: clientRight,
                    child: CacheProvider(child: RightButton()),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
