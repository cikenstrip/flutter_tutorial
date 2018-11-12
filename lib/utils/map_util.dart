import 'package:map_view/map_view.dart';
import 'package:flutter_tutorial/utils/gps_util.dart';
import 'package:flutter_tutorial/page_maproute.dart';
//4
import 'package:flutter_tutorial/utils/direction_util.dart';
import 'package:flutter_tutorial/model/steps.dart';
import 'package:map_view/polyline.dart';
import 'package:flutter/material.dart';

class MapUtil implements GpsUtilListener {

  CameraPosition cameraPosition;
  var staticMapProvider;

  var location = new Location(0.0, 0.0);
  var destination = new Location(-6.941732, 107.628380);
  var zoomLevel = 18.0;
  MapView mapView;

  DirectionUtil direction = new DirectionUtil();
  GpsUtils gpsUtils;
  ScreenListener _screenListener;
  MapUtil(this._screenListener);
  //MapUtil(_pageMaprouteState);
  List<Location> ruasJalan;

  init() {
    mapView = new MapView();
    gpsUtils = new GpsUtils(this);
    gpsUtils.init();
    staticMapProvider = new StaticMapProvider("AIzaSyA9PlS0azhijGA57bt0WWiRpbugtAW33S8");
  }

  List<Marker> getMarker(double scrLat,double scrLng,double desLat,double desLng) {
    List<Marker> markers = <Marker>[
      new Marker("1", "Posisi Saya", scrLat, scrLng, color: Colors.amber),
      new Marker("2", "Tujuan", desLat, desLng, color: Colors.red),
    ];
    return markers;
  }

  Uri getStaticMap() {
    //return staticMapProvider.getStaticUri(getMyLocation(), zoomLevel.toInt());
    return staticMapProvider.getStaticUriWithMarkers(
      getMarker(
        location.latitude,location.longitude,
        destination.latitude,destination.longitude));
  }

  Location getMyLocation() {
    return location;
  }

  CameraPosition getCamera() {
    cameraPosition = new CameraPosition(getMyLocation(), zoomLevel);
    return cameraPosition;
  }

  @override
  whenLocationChange(Map<String, double> currentLocation) {
    location = Location(
      currentLocation["latitude"], 
      currentLocation["longitude"]);
    _screenListener.updateScreen(location);
  }

  showMap() {
    mapView.show(
      MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: getCamera(),
        showUserLocation: true,
        title: "Sample Map /w Route"
      ),
      toolbarActions: [new ToolbarAction("Close", 1)]);
    mapView.onToolbarAction.listen((id) {
      if (id == 1) { mapView.dismiss(); }
    });
  }
  
  getDirectionSteps(double destinationLat, double destinationLng) {
    direction.get("origin=" + location.latitude.toString() + "," +
                              location.longitude.toString() +
            "&destination=" + destinationLat.toString() + "," +
                              destinationLng.toString() +
            "&key=GET_YOUR_GOOGLE_MAP_API_KEY")
    .then((dynamic res) {
      List<Steps> ruasInJSON = res;
      //print(res.toString());
      ruasJalan = new List();
      for (final i in ruasInJSON) {
        ruasJalan.add(i.startLocation);
        ruasJalan.add(i.endLocation);
      }
      mapView.onMapReady.listen((_) {
        mapView.setMarkers(getMarker(
          location.latitude,location.longitude,
          destinationLat,destinationLng));
        mapView.addPolyline(new Polyline("10",ruasJalan,width:12.0));
      });
      showMap();
    });
  }

}