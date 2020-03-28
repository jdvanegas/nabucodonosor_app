import 'package:flutter/material.dart';
import 'package:nabucodonosor_app/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'Nabucodonosor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePage()
    );
  }
}
