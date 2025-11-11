import 'package:doit_app/ui/home/contract/event/home_event.dart';
import 'package:doit_app/ui/home/view/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/di.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeViewModelProvider);
    return asyncState.when(
      data: (state) {
        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return Dismissible(
              key: ValueKey(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) {
                ref
                    .read(homeViewModelProvider.notifier)
                    .setEvent(RemoveTodo(item));
              },
              child: TodoItem(item),
            );
          },
        );
      },
      error: (e, r) => Center(child: Text('데이터 로드 오류: ${e.toString()}')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
