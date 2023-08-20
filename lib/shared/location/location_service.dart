import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationService {
  final location = Location();

  Future<LatLng?> getCurrent() async {
    final data = await location.getLocation();
    if (data.latitude == null || data.longitude == null) {
      return null;
    }
    return LatLng(data.latitude!, data.longitude!);
  }

  Stream<LatLng?> stream() {
    return location.onLocationChanged.map((event) {
      if (event.latitude == null || event.longitude == null) {
        return null;
      }
      return LatLng(event.latitude!, event.longitude!);
    });
  }
}
