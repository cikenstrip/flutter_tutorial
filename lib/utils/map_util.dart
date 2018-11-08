import 'package:map_view/map_view.dart';
import 'package:flutter_tutorial/utils/gps_util.dart';

class MapUtil implements GpsUtilListener {

  CameraPosition cameraPosition;
  var staticMapProvider;
  var location = new Location(-6.90251125, 107.61878508364990);
  var zoomLevel = 18.0;
  MapView mapView;

  GpsUtils gpsUtils;
  MapUtil(_pageMaprouteState);

  init() {
    mapView = new MapView();
    gpsUtils = new GpsUtils(this);
    gpsUtils.init();
    staticMapProvider = new StaticMapProvider("AIzaSyCYBGhU1WEp_o_ZlFuBiogyyY_P9aXalUQ");
  }

  List<Marker> getMarker() {
    List<Marker> markers = <Marker>[
      new Marker("1", "Posisi: Gedung Sate", -6.90251125, 107.61878508),
      new Marker("2", "Tujuan: Gedung Merdeka", -6.92097905, 107.60923329),
    ];
    return markers;
  }

  Uri getStaticMap() {
    //return staticMapProvider.getStaticUri(getMyLocation(), zoomLevel.toInt());
    return staticMapProvider.getStaticUriWithMarkers(getMarker());
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
  }

}