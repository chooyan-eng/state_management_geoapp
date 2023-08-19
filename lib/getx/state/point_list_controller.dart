import 'package:get/get.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class PointListController extends GetxController {
  var pointList = <Point>[].obs;

  void add(Point point) {
    pointList.value = [...pointList, point];
  }
}
