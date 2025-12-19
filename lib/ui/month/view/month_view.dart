import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/month/contract/event/month_event.dart';
import 'package:doit_app/ui/month/view/widget/month_content.dart';
import 'package:doit_app/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthView extends ConsumerWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthState = ref.watch(monthViewModelProvider);
    final viewModel = ref.read(monthViewModelProvider.notifier);
    final selectedDate = monthState.value?.selectedDate ?? DateTime.now();
    return monthState.when(
      data: (state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () => viewModel.setEvent(OnClickPreviousMonth()),
                  child: Icon(Icons.chevron_left),
                ),
                Text(
                  '${selectedDate.year}년 ${selectedDate.month}월',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () => viewModel.setEvent(OnClickNextMonth()),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TableCalendar(
                locale: 'ko_KR',
                focusedDay: selectedDate,
                firstDay: DateTime.utc(2021, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                headerVisible: false,
                calendarStyle: CalendarStyle(
                  rowDecoration: BoxDecoration(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.redAccent),
                  holidayTextStyle: TextStyle(color: Colors.redAccent),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.black),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor.withAlpha(150),
                  ),
                  todayTextStyle: TextStyle(color: Colors.black.withAlpha(150)),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(color: Colors.white),
                ),
                onDaySelected: (selectedDay, _) {
                  viewModel.setEvent(OnSelectedDate(selectedDay));
                },
                onPageChanged: (focusDay) {
                  viewModel.setEvent(OnSelectedDate(focusDay));
                },
                selectedDayPredicate: (day) {
                  return isSameDay(day, selectedDate);
                },
              ),
              Expanded(
                child: Container(color: Colors.white, child: MonthContent()),
              ),
            ],
          ),
        );
      },
      error: (e, _) => Center(child: Text('데이터 로드 오류: ${e.toString()}')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
