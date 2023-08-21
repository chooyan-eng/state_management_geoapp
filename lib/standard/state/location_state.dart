import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:state_management_geoapp/shared/location/location_permission_service.dart';
import 'package:state_management_geoapp/shared/location/location_service.dart';

class LocationStateProvider extends InheritedNotifier<LocationNotifier> {
  static LocationNotifier of(BuildContext context, {bool listen = false}) {
    late final LocationStateProvider? widget;
    if (listen) {
      widget =
          context.dependOnInheritedWidgetOfExactType<LocationStateProvider>();
    } else {
      widget = context.findAncestorWidgetOfExactType<LocationStateProvider>();
    }

    assert(widget != null);
    return widget!.notifier!;
  }

  LocationStateProvider({
    super.key,
    required super.child,
  }) : super(notifier: LocationNotifier());
}

class LocationNotifier extends ChangeNotifier {
  final _permissionService = LocationPermissionService();
  final _service = LocationService();
  StreamSubscription? _locationUpdateSubscription;

  bool locationEnabled = false;
  LatLng? currentLocation;
  bool get isTracking => _locationUpdateSubscription != null;

  LocationNotifier() {
    _permissionService.check().then((value) {
      locationEnabled = value == Permission.granted;
      notifyListeners();
    });
  }

  void requestLocation() {
    _permissionService.request().then((value) {
      locationEnabled = value == Permission.granted;
      notifyListeners();
    });
  }

  void startTracking() {
    _locationUpdateSubscription = _service.stream().listen((event) {
      currentLocation = event;
      notifyListeners();
    });
    notifyListeners();
  }

  void stopTracking() {
    _locationUpdateSubscription?.cancel();
    _locationUpdateSubscription = null;
    notifyListeners();
  }

  void updateCurrentLocation() {
    _service.getCurrent().then((value) {
      currentLocation = value;
      notifyListeners();
    });
  }
}
