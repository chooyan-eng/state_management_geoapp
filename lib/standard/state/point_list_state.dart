import 'package:flutter/material.dart';
import 'package:state_management_geoapp/shared/model/point.dart';

class PointListProvider extends StatefulWidget {
  const PointListProvider({super.key, required this.child});

  final Widget child;

  static PointListState of(
    BuildContext context, {
    bool listen = false,
  }) {
    late final PointListContainer? widget;
    if (listen) {
      widget = context.dependOnInheritedWidgetOfExactType<PointListContainer>();
    } else {
      widget = context.getInheritedWidgetOfExactType<PointListContainer>();
    }

    assert(widget != null);

    return widget!.state;
  }

  @override
  State<PointListProvider> createState() => PointListState();
}

class PointListState extends State<PointListProvider> {
  List<Point> pointList = [];

  void add(Point point) {
    setState(() => pointList = [...pointList, point]);
  }

  @override
  Widget build(BuildContext context) {
    return PointListContainer(
      state: this,
      child: widget.child,
    );
  }
}

class PointListContainer extends InheritedWidget {
  PointListContainer({
    super.key,
    required super.child,
    required this.state,
  }) : cache = state.pointList;

  final PointListState state;
  final List<Point> cache;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    final prev = oldWidget as PointListContainer;
    return prev.cache != state.pointList;
  }
}
