import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_geoapp/shared/location/location_permission_service.dart';

part 'location_permission.g.dart';

@Riverpod(keepAlive: true)
class LocationPermission extends _$LocationPermission {
  final service = LocationPermissionService();

  @override
  Future<Permission> build() async {
    return await service.check();
  }

  Future<void> request() async {
    final permission = await service.request();
    state = AsyncData(permission);
  }
}
