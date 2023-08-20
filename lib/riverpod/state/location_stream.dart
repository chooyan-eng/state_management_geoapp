import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_geoapp/shared/location/location_service.dart';

part 'location_stream.g.dart';

@riverpod
Stream<LatLng?> locationStream(LocationStreamRef ref) {
  return LocationService().stream();
}
