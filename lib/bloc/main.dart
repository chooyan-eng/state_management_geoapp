import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_geoapp/bloc/map_page.dart';
import 'package:state_management_geoapp/bloc/state/point_list_cubit.dart';

void blocMain() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PointListCubit(),
      child: const MaterialApp(
        home: MapPage(),
      ),
    );
  }
}
