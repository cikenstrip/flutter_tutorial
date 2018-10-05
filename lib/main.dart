import 'package:flutter/material.dart';
import 'helloworld.dart';
import 'page_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Aplikasi Pertama",
        routes: {
          '/': (context)=> HelloWorld(),
          '/pagelist': (context)=> PageList(),
        },
        initialRoute: '/',
      );
  }
}
