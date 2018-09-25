import 'package:flutter/material.dart';

class PageBottomnavbar extends StatefulWidget {
  @override
  _PageBottomnavbarState createState() => new _PageBottomnavbarState();
}

class _PageBottomnavbarState extends State<PageBottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bottom Nav Bar"),
      ),
      body: new PageView(
        children: <Widget>[
          new Center(child: new Text("Halaman satu.")),
          new Center(child: new Text("Halaman dua.")),
          new Center(child: new Text("Halaman tiga.")),
        ],
      )
    );
  }
}