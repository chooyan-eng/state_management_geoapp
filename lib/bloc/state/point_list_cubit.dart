import 'package:bloc/bloc.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class PointListCubit extends Cubit<List<Point>> {
  PointListCubit() : super([]);

  void add(Point point) => emit([...state, point]);
}
