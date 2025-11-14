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
            '일정과 내용을 추가하세요',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
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
          final picker = await _showRollingDateTimePicker(context);
          if (picker != null) {
            ref.read(bottomSheetProvider.notifier).setDateTime(picker);
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}시 ${dateTime.minute}분',style: TextStyle(fontSize: 18),),
      ),
    );
  }

  Widget _contentItem(WidgetRef ref) {
    final content = ref.watch(bottomSheetProvider).content;
    return TextField(
      decoration: const InputDecoration(
        labelText: '내용을 입력하세요',
        labelStyle: TextStyle(color: Colors.blueAccent),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      controller: TextEditingController(text: content)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: content.length),
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
          foregroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        child: Text('일정 추가하기'),
      ),
    );
  }

  Future<DateTime?> _showRollingDateTimePicker(BuildContext context) {
    return showModalBottomSheet<DateTime>(
      context: context,
      builder: (_) {
        DateTime temp = DateTime.now();

        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  use24hFormat: true,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (value) => {temp = value},
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.pop(temp);
                  },
                  child: Text('확인', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
