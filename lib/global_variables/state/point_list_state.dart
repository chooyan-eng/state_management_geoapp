import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

var pointListState = PointListState();

class PointListState extends ValueNotifier<List<Point>> {
  PointListState() : super([]);

  void add(Point point) {
    value = [...value, point];
  }
}
