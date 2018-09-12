import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Aplikasi Pertama",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Hello World"),
          ),
          body: new Center(
            child: new Text("Hello world!"),
          ),
        ),
      );
  }
}