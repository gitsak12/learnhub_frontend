import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_notifier.g.dart';

@riverpod
class Welcome extends _$Welcome {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }
}
