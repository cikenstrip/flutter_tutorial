import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/map_util.dart';
import 'package:map_view/map_view.dart';

abstract class ScreenListener {
  updateScreen(Location location);
}

class PageMaproute extends StatefulWidget {
  @override
  _PageMaprouteState createState() => new _PageMaprouteState();
}

class _PageMaprouteState extends State<PageMaproute> implements ScreenListener {

  MapUtil mapUtil;
  String myLocation = "";

  @override
  void initState() {
    super.initState();
    mapUtil = new MapUtil(this);
    mapUtil.init();
    //updateScreen(mapUtil.getMyLocation());
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = Column(
      children: <Widget>[
        Center(
          child: Container(
            child: Center(
                child: new Image.network(mapUtil.getStaticMap().toString()),
              ),
          ),
        ),
        Center(
          child: Container(
            child: new Text(myLocation,
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.all(20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () { },
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Draw Route'),
              ],
            ),
          ),
        ),
      ],
    );

    return new Scaffold(
      backgroundColor: const Color(0xFFA6AFAA),
      appBar: AppBar(
        title: new Text("Sample Map /w Route"),
      ),
      body: SingleChildScrollView(
        child: screenWidget,
      ),
    );
  }

  @override
  updateScreen(Location location) {
    myLocation = "You are at: " +
        location.latitude.toString() + ", " + 
        location.longitude.toString();
    setState(() {});
  }

}
