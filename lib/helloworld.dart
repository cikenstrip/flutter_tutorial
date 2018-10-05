import 'package:flutter/material.dart';
import 'widget_drawercustom.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          drawer: new DrawercustomWidget(),
          appBar: new AppBar(
            title: new Text("Hello World"),
          ),
          body: new Center(
            child: RaisedButton(
              child: Text('Lihat List User'),
              onPressed: () {
                Navigator.pushNamed(context, '/pagelist');
              },
            ),
          ),
      );
    }
}
