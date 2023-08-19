import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'point.freezed.dart';

@freezed
class Point with _$Point {
  factory Point({
    required LatLng coordinate,
    required String comment,
  }) = _Point;
}
