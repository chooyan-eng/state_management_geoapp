import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class PointListState extends ChangeNotifier {
  final List<Point> pointList = [];

  void add(Point point) {
    pointList.add(point);
    notifyListeners();
  }
}
