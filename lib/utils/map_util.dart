import 'package:map_view/map_view.dart';

class MapUtil {

  CameraPosition cameraPosition;
  var staticMapProvider;
  var location = new Location(-6.90251125, 107.61878508364904);
  var zoomLevel = 18.0;
  MapView mapView;

  MapUtil(_pageMaprouteState);

  init() {
    mapView = new MapView();
    staticMapProvider = new StaticMapProvider("GET_YOUR_GOOGLE_MAP_API_KEY");
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

}