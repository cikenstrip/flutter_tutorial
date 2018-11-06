import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'helloworld.dart';
import 'page_list.dart';
import 'page_splash.dart';
import 'page_map.dart';
import 'page_map2.dart';
import 'package:flutter_tutorial/page_maproute.dart';
import 'page_gps.dart';

void main() {
  //MapView.setApiKey("AIzaSyBahD-7rlR50U23MsUc0AipO6PJhUQdYP0");
  MapView.setApiKey("AIzaSyCYBGhU1WEp_o_ZlFuBiogyyY_P9aXalUQ");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Aplikasi Pertama",
        routes: {
          '/': (context)=> PageSplash(),
          '/pagehelloworld': (context)=> HelloWorld(),
          '/pagelist': (context)=> PageList(),
          '/pagemap': (context)=> PageMap(),
          '/pagemap2': (context)=> PageMap2(),
          '/pagemaproute': (context)=> PageMaproute(),
          '/pagegps': (context)=> PageGps(),
        },
      );
  }
}
