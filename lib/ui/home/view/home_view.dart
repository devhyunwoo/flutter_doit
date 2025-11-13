import 'package:doit_app/ui/home/contract/effect/home_effect.dart';
import 'package:doit_app/ui/home/contract/event/home_event.dart';
import 'package:doit_app/ui/home/view/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:doit_app/ui/home/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/di.dart';

class HomeState extends ConsumerStatefulWidget {
  const HomeState({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeState> {
  @override
  void initState() {
    super.initState();
    ref.read(homeViewModelProvider.notifier).effect.listen((effect) {
      switch (effect) {
        case ShowBottomSheet():
          {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: HomeBottomSheet(),
                ),
              ),
            ).whenComplete(() {
              ref.read(homeViewModelProvider.notifier).setEvent(ReloadData());
            });
          }

        case ShowDialog():
          {
            showDialog(
              context: context,
              builder: (_) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: _homeDialog(ref),
                );
              },
            );
          }
      }
    });
  }

  Widget _homeDialog(WidgetRef ref) {
    final query = ref.watch(homeViewModelProvider).value?.query ?? '';
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: (query) => ref
                .read(homeViewModelProvider.notifier)
                .setEvent(OnChangeQuery(query)),
            decoration: const InputDecoration(
              labelText: '검색어를 입력하세요',
              labelStyle: TextStyle(color: Colors.blueAccent),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              ),
            ),
            controller: TextEditingController(text: query)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: query.length),
              ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          onPressed: () => {viewModel.setEvent(OnClickAddTodo())},
          child: Center(child: const Icon(Icons.plus_one)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
