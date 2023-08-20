// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PointList on PointListBase, Store {
  late final _$pointListAtom =
      Atom(name: 'PointListBase.pointList', context: context);

  @override
  ObservableList<Point> get pointList {
    _$pointListAtom.reportRead();
    return super.pointList;
  }

  @override
  set pointList(ObservableList<Point> value) {
    _$pointListAtom.reportWrite(value, super.pointList, () {
      super.pointList = value;
    });
  }

  late final _$PointListBaseActionController =
      ActionController(name: 'PointListBase', context: context);

  @override
  void add(Point point) {
    final _$actionInfo =
        _$PointListBaseActionController.startAction(name: 'PointListBase.add');
    try {
      return super.add(point);
    } finally {
      _$PointListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pointList: ${pointList}
    ''';
  }
}
