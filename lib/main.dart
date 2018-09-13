import 'package:flutter/material.dart';
import 'model_user.dart';
import 'helloworld.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      print(users[0].first+" "+users[0].last);
      return MaterialApp(
        title: "Aplikasi Pertama",
        home: new HelloWorld(),
      );
  }
}