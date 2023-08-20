import 'package:location/location.dart';

enum Permission { granted, denied }

class LocationPermissionService {
  final location = Location();

  Future<Permission> check() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Permission.denied;
      }
    }

    final status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      return Permission.denied;
    }
    return Permission.granted;
  }

  Future<Permission> request() async {
    final permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return Permission.denied;
    }
    return Permission.granted;
  }
}
