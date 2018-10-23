import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class PageMap2 extends StatefulWidget {
  @override
  _PageMap2State createState() => new _PageMap2State();
}

class _PageMap2State extends State<PageMap2> {
  MapView mapView;
  CameraPosition cameraPosition;
  var apiKey = "AIzaSyBahD-7rlR50U23MsUc0AipO6PJhUQdYP0";
  var staticMapProvider;
  var latLong = new Location(-6.90389, 107.61861);
  var zoomLevel = 12.0;

  @override
  void initState() {
    super.initState();
    cameraPosition = new CameraPosition(latLong, zoomLevel);
    mapView = new MapView();
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: cameraPosition,
        showUserLocation: true,
        title: "Sample Map /w Toolbar"),
      toolbarActions: [new ToolbarAction("Close", 1)]);
    mapView.onMapReady.listen((_) {  
      mapView.setMarkers(<Marker>[
        new Marker("1", "Cafe White Foxes", -6.90349, 107.62761),
        new Marker("2", "Ririungans Coffee", -6.90389, 107.62841),
      ]);
    });
    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        mapView.dismiss();
        Navigator.pushNamed(context, '/pagehelloworld');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Sample Map with Toolbar"),
      ),
    );
  }

}
