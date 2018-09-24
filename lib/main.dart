import 'package:flutter/material.dart';
import 'page_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Aplikasi Pertama",
        home: new PageList(),
      );
  }
}