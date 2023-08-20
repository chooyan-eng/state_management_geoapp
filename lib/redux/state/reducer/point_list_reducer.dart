import 'package:state_management_geoapp/redux/state/actions/add_point_action.dart';
import 'package:state_management_geoapp/redux/state/app_state.dart';

AppState pointListReducer(AppState state, dynamic action) {
  if (action is AddPointAction) {
    return AppState(pointList: [...state.pointList, action.point]);
  } else {
    return state;
  }
}
