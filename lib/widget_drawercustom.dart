import 'package:flutter/material.dart';

class DrawercustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('List User'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pagelist');
            },
          ),
        ],
      ),
    );
  }
}
