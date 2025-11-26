import 'package:doit_app/ui/di/di.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MonthContent extends ConsumerWidget {
  const MonthContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthState = ref.watch(monthViewModelProvider);
    return monthState.when(
      data: (state) {
        return ListView.builder(
          itemCount: state.groupedTodos.length,
          itemBuilder: (context, index) {
            final date = state.groupedTodos.keys.elementAt(index);
            final todos = state.groupedTodos[date]!;
            return StickyHeader(
              header: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.center,
                child: Text(
                  '${date.day} 일',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              content: Container(
                color: Colors.white,
                child: Column(
                  children: todos.map((todo) => _item(todo)).toList(),
                ),
              ),
            );
          },
        );
      },
      error: (e, r) => Center(child: Text('데이터 로드 오류: ${e.toString()}')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

Widget _item(TodoModel todo) {
  final isDone = todo.isDone == 1;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: isDone ? Colors.blueAccent : Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (todo.imageUrl.isEmpty)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.hourglass_empty, size: 25.0),
          )
        else
          Image.network(todo.imageUrl, width: 50, height: 50),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                todo.content,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${todo.dateTime.hour}시 ${todo.dateTime.minute}분',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
