import 'package:doit_app/ui/home/contract/event/home_event.dart';
import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:doit_app/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/di.dart';

class TodoItem extends ConsumerWidget {
  final TodoModel todoModel;

  const TodoItem(this.todoModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = todoModel.isDone == 1;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        color: isDone ? Colors.grey.shade200 : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              ref
                  .read(homeViewModelProvider.notifier)
                  .setEvent(OnClickImage(todoModel));
            },
            child: todoModel.imageUrl.isEmpty
                ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, size: 45.0),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      todoModel.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref
                    .read(homeViewModelProvider.notifier)
                    .setEvent(OnClickAddTodo(todoModel));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoModel.content,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    todoModel.isTBD == 1
                        ? '날짜 미정'
                        : '${todoModel.dateTime.hour.toString().padLeft(2, '0')}시 ${todoModel.dateTime.minute.toString().padLeft(2, '0')}분',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
            ),
            onPressed: () {
              ref
                  .read(homeViewModelProvider.notifier)
                  .toggleDoneButton(todoModel);
            },
            child: Text(
              isDone ? '취소하기' : '완료하기',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
