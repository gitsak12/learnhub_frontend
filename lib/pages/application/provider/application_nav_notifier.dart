import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_nav_notifier.g.dart';
@riverpod
class ApplicationNavNotifier extends _$ApplicationNavNotifier {
  int build()
  {
    return 0;
  }

  void changeIndex(int index)
  {
    state = index;

  }
}
