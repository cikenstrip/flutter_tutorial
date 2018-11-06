import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class PageGps extends StatefulWidget {
  @override
  _PageGpsState createState() => new _PageGpsState();
}

class _PageGpsState extends State<PageGps> {

  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  StreamSubscription<Map<String, double>> _locationSubscription;
  Location _location = new Location();
  bool _permission = false;
  String error;

  initPlatformState() async {
    Map<String, double> location;
    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied, ask the user to enable it';
      }
      location = null;
    }
    setState(() {
        _startLocation = location;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    // Listening _location berubah tidak, stream hasilnya dilempar ke _locationSubscription
    _locationSubscription =
    _location.onLocationChanged().listen((Map<String,double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    if (_currentLocation == null) {
      widgets = new List();
    } else {
      widgets = [
        new Image.network(
          "https://maps.googleapis.com/maps/api/staticmap?"+
          "center=${_currentLocation['latitude']},${_currentLocation['longitude']}"+
          "&zoom=18&size=640x400&key=GET_YOUR_GOOGLE_MAP_API_KEY")
      ];
    }

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Start location: $_startLocation\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(_currentLocation != null
            ? 'Continuous location: $_currentLocation\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
      child: new Text(_permission 
            ? 'Has permission : Yes' 
            : "Has permission : No")));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sample GPS'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      )
    );
  }

}
