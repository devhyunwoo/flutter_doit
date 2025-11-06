import 'package:doit_app/ui/home/view/widgets/home_body.dart';
import 'package:doit_app/ui/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/event/home_event_state.dart';

class HomeState extends ConsumerWidget {
  const HomeState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider.notifier);
    ref.listen(homeEventStateProvider, (prev, next) {
      if (next.showBottomSheet) {}
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          '오늘 할일',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: HomeBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: FloatingActionButton(
          onPressed: () => {
            ref.read(homeEventStateProvider.notifier).showBottomSheet(),
          },
          child: Center(child: const Icon(Icons.plus_one)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
