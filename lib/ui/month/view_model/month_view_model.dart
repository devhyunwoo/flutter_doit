import 'dart:async';

import 'package:doit_app/ui/month/contract/event/month_event.dart';
import 'package:doit_app/ui/month/contract/state/month_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthViewModel extends AsyncNotifier<MonthState> {
  @override
  FutureOr<MonthState> build() {
    final now = DateTime.now();
    return MonthState(todos: [], selectedMonth: now.month);
  }

  Future<void> setEvent(MonthEvent event) async {
    switch (event) {
      case OnClickPreviousMonth():
        {
          final currentMonth =
              state.value?.selectedMonth ?? DateTime.now().month;
          final previousMonth = currentMonth == 1 ? 12 : currentMonth - 1;
          state = AsyncValue.data(
            state.value!.copyWith(selectedMonth: previousMonth),
          );
        }

      case OnClickNextMonth():
        {
          final currentMonth =
              state.value?.selectedMonth ?? DateTime.now().month;
          final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;
          state = AsyncValue.data(
            state.value!.copyWith(selectedMonth: nextMonth),
          );
        }
    }
  }
}
