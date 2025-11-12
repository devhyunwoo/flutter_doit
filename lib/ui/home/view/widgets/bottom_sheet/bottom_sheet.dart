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
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '현재 선택된 날짜 : ${dateTime.year} - ${dateTime.month} - ${dateTime.day}',
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () async {
            final picker = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
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
          child: const Text('날짜를 변경하세요'),
        ),
      ],
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
}
