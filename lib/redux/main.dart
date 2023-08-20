import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management_geoapp/redux/map_page.dart';
import 'package:state_management_geoapp/redux/state/app_state.dart';
import 'package:state_management_geoapp/redux/state/reducer/point_list_reducer.dart';

void main() {
  final store = Store<AppState>(pointListReducer, initialState: AppState());
  runApp(MainApp(store: store));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: MapPage(),
      ),
    );
  }
}
