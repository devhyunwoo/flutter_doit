import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/month/contract/event/month_event.dart';
import 'package:doit_app/ui/month/view/widget/month_content.dart';
import 'package:doit_app/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthView extends ConsumerWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthState = ref.watch(monthViewModelProvider);
    final viewModel = ref.read(monthViewModelProvider.notifier);
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
                  '${monthState.value?.selectedMonth}월',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () => viewModel.setEvent(OnClickNextMonth()),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          body: Container(
              color : Colors.white, child: MonthContent()),
        );
      },
      error: (e, _) => Center(child: Text('데이터 로드 오류: ${e.toString()}')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
