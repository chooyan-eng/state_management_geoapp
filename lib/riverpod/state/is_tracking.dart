import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'is_tracking.g.dart';

@riverpod
class IsTracking extends _$IsTracking {
  @override
  bool build() => false;

  void start() => state = true;
  void stop() => state = false;
}
