import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:doit_app/utils/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../di/di.dart';

class HomeBottomSheet extends ConsumerStatefulWidget {
  final TodoModel? currentTodo;

  const HomeBottomSheet({this.currentTodo, super.key});

  @override
  ConsumerState<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends ConsumerState<HomeBottomSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentTodo?.content);
    if (widget.currentTodo != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(bottomSheetProvider.notifier).setTodo(widget.currentTodo!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _dateTimeItem(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(bottomSheetProvider);

    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: todo.isTBD == 1,
                onChanged: (checked) {
                  ref
                      .read(bottomSheetProvider.notifier)
                      .setTbd(checked == true ? 1 : 0);
                },
              ),
              Text(
                '날짜 미정',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () async {
                if (todo.isTBD == 1) return;
                final picker = await _showRollingDateTimePicker(
                  context,
                  todo.dateTime,
                );
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
                (todo.isTBD == 0)
                    ? '${todo.dateTime.year}/${todo.dateTime.month}/${todo.dateTime.day} ${todo.dateTime.hour}시 ${todo.dateTime.minute}분'
                    : '날짜 미정',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contentItem(WidgetRef ref) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
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
          ref
              .read(bottomSheetProvider.notifier)
              .addTodo(widget.currentTodo != null);
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
