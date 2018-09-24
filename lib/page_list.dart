import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("List User"),
        ),
        body: new ListView(
          children: <Widget>[
            ListTile(
              title: new Text("Nama"),
              subtitle: new Text("alamat_email@domain.com"),
              leading: new CircleAvatar(child: new Text("N"),),
            ),
            ListTile(
              title: new Text("Nama"),
              subtitle: new Text("alamat_email@domain.com"),
              leading: new CircleAvatar(child: new Text("N"),),
            ),
          ],
        ),
      );
    }
}