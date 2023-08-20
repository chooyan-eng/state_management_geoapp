import 'package:state_management_geoapp/shared/model/point.dart';

class AppState {
  List<Point> pointList;

  AppState({
    this.pointList = const [],
  });
}
