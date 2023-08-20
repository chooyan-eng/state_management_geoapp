import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_geoapp/riverpod/state/location_permission.dart';
import 'package:state_management_geoapp/shared/location/location_permission_service.dart';

part 'location_enabled.g.dart';

@Riverpod(keepAlive: true)
bool locationEnabled(LocationEnabledRef ref) {
  return ref.watch(locationPermissionProvider).value == Permission.granted;
}
