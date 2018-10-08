import 'package:flutter/material.dart';
import 'dart:async';

class PageSplash extends StatefulWidget {
  @override
  _PageSplashState createState() => new _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {

  startTime() async {
    var _duration = new Duration(seconds:2);
    return Timer(_duration, tofirstPage);
  }

  void tofirstPage() {
    Navigator.of(context).pushReplacementNamed('/pagehelloworld');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('images/logo.png')),
    );
  }
}
