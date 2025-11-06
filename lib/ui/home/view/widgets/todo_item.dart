import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:doit_app/ui/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItem extends ConsumerWidget {
  final TodoModel todoModel;

  const TodoItem(this.todoModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(todoModel.title), Text(todoModel.content)],
            ),
          ),
          Checkbox(
            value: todoModel.isDone,
            onChanged: (bool? value) {
              ref
                  .read(homeViewModelProvider.notifier)
                  .toggleDoneButton(todoModel);
            },
          ),
        ],
      ),
    );
  }
}
