import 'package:doit_app/ui/home/view/widgets/bottom_sheet/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          _TitleItem(ref),
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
          child: Text('날짜를 변경하세요'),
        ),
      ],
    );
  }

  Widget _TitleItem(WidgetRef ref) {
    final title = ref.watch(bottomSheetProvider).title;
    return TextField(
      decoration: const InputDecoration(labelText: '제목을 입력하세요'),
      controller: TextEditingController(text: title)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: title.length),
        ),
      onChanged: ref.read(bottomSheetProvider.notifier).setTitle,
    );
  }
}
