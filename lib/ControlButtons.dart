import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nabucodonosor_app/ControlButtons/DownButton.dart';
import 'package:nabucodonosor_app/ControlButtons/LeftButton.dart';
import 'package:nabucodonosor_app/ControlButtons/RightButton.dart';
import 'package:nabucodonosor_app/ControlButtons/UpButton.dart';

class ControlButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(left: 60.0, right: 20.0, bottom: 50.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpButton(),
              DownButton()
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Row(
                children: [
                  LeftButton(),
                  RightButton()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
