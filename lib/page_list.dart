import 'package:flutter/material.dart';
import 'model_user.dart';

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("List User"),
        ),
        body: new ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, int){
            return ListTile(
              title: new Text(users[int].first + " " + users[int].last),
              subtitle: new Text(users[int].email),
              leading: new CircleAvatar(
                backgroundImage: new NetworkImage(users[int].picture),
              ),
            );
          },
        ),
      );
    }
}