import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_geoapp/riverpod/state/is_tracking.dart';
import 'package:state_management_geoapp/riverpod/state/location_stream.dart';
import 'package:state_management_geoapp/shared/location/location_service.dart';

part 'current_location.g.dart';

@riverpod
class CurentLocation extends _$CurentLocation {
  final locationService = LocationService();

  @override
  LatLng? build() {
    final isTracking = ref.watch(isTrackingProvider);

    // when isTracking == false, ref.listen is automatically stopped
    if (isTracking) {
      ref.listen(locationStreamProvider, (_, next) {
        state = next.value;
      });
    }

    return null;
  }

  void updateWithCurrent() {
    locationService.getCurrent().then(
          (value) => state = value,
        );
  }
}
