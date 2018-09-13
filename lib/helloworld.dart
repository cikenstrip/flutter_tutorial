import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: new AppBar(
            title: new Text("Hello World"),
          ),
          body: new Center(
            child: new Text("Hello world! "),
          ),
      );
    }
}