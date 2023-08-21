import 'package:state_management_geoapp/shared/model/point.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'point_list_state.g.dart';

@riverpod
class PointList extends _$PointList {
  @override
  List<Point> build() => [];

  void add(Point point) {
    state = [...state, point];
  }
}
