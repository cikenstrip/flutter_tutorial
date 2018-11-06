import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class PageMap extends StatefulWidget {
  @override
  _PageMapState createState() => new _PageMapState();
}

class _PageMapState extends State<PageMap> {
  MapView mapView;
  CameraPosition cameraPosition;
  var apiKey = "GET_YOUR_GOOGLE_MAP_API_KEY";
  var staticMapProvider;
  var latLong = new Location(-6.90389, 107.61861);
  var zoomLevel = 12.0;

  Location getMyLocation() {
    return latLong;
  }

  Uri getStaticMap() {
    return staticMapProvider.getStaticUriWithMarkers(mapView.markers);
  }
  
  @override
  void initState() {
    super.initState();
    staticMapProvider = new StaticMapProvider(apiKey);
    cameraPosition = new CameraPosition(getMyLocation(), zoomLevel);
    mapView = new MapView();
    mapView.setMarkers(<Marker>[
      new Marker("1", "Cafe White Foxes", -6.90349, 107.62761),
      new Marker("2", "Ririungans Coffee", -6.90389, 107.62841),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Sample Map"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom:5.0),
            child: Image.network(getStaticMap().toString(),
          )),
          Text("BANDUNG"),
          Text("Latitude: " + latLong.latitude.toString()),
          Text("Longitude: " + latLong.longitude.toString()),
        ]      
      ),
    );
  }

}
