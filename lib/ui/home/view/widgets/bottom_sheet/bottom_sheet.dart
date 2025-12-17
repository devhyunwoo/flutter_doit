import 'package:doit_app/utils/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../di/di.dart';

class HomeBottomSheet extends ConsumerWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '일정을 추가하세요',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          _dateTimeItem(context, ref),
          SizedBox(height: 10),
          _contentItem(ref),
          SizedBox(height: 10),
          _addButtonItem(context, ref),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _dateTimeItem(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(bottomSheetProvider).dateTime;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final picker = await _showRollingDateTimePicker(context, dateTime);
          if (picker != null) {
            ref.read(bottomSheetProvider.notifier).setDateTime(picker);
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
        ),
        child: Text(
          '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}시 ${dateTime.minute}분',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _contentItem(WidgetRef ref) {
    return TextField(
      decoration: const InputDecoration(
        labelText: '내용을 입력하세요',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
      ),
      onChanged: ref.read(bottomSheetProvider.notifier).setContent,
      minLines: 5,
      maxLines: null,
    );
  }

  Widget _addButtonItem(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ref.read(bottomSheetProvider.notifier).addTodo();
          context.pop();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
        ),
        child: Text('일정 추가하기'),
      ),
    );
  }

  Future<DateTime?> _showRollingDateTimePicker(
    BuildContext context,
    DateTime selectedDate,
  ) {
    return showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        DateTime temp = DateTime.now();

        return SafeArea(
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    use24hFormat: true,
                    initialDateTime: selectedDate,
                    onDateTimeChanged: (value) => {temp = value},
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      context.pop(temp);
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
