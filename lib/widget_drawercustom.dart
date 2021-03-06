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
          ListTile(
            title: Text('Map Static'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pagemap');
            },
          ),
          ListTile(
            title: Text('My Location'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pagegps');
            },
          ),
          ListTile(
            title: Text('Map with Toolbar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pagemap2');
            },
          ),
          ListTile(
            title: Text('Map with Route'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pagemaproute');
            },
          ),
        ],
      ),
    );
  }
}
