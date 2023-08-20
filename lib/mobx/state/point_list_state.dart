import 'package:mobx/mobx.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

part 'point_list_state.g.dart';

class PointList = PointListBase with _$PointList;

abstract class PointListBase with Store {
  PointListBase();

  @observable
  ObservableList<Point> pointList = <Point>[].asObservable();

  @action
  void add(Point point) {
    pointList.add(point);
  }
}
