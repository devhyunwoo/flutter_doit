import 'package:doit_app/ui/home/contract/event/home_event.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/di.dart';

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
          ElevatedButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).setEvent(OnClickImage());
            },
            child: todoModel.imageUrl.isEmpty
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, size: 45.0),
                  )
                : Image.network(
                    todoModel.imageUrl,
                    width: 50,
                    height: 50,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
                  ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoModel.dateTime.toIso8601String(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  todoModel.content,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: todoModel.isDone == 0 ? false : true,
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
