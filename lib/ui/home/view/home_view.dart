import 'package:doit_app/ui/home/contract/effect/home_effect.dart';
import 'package:doit_app/ui/home/contract/event/home_event.dart';
import 'package:doit_app/ui/home/view/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:doit_app/ui/home/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../di/di.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).effect.listen((effect) async {
        switch (effect) {
          case ShowBottomSheet():
            {
              showModalBottomSheet(
                isScrollControlled: true,
                useRootNavigator: true,
                context: context,
                builder: (sheetContext) => SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
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
              final result = await showDialog<String>(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Dialog(child: _homeDialog(context, ref)),
                  );
                },
              );

              if (result != null) {
                ref
                    .read(homeViewModelProvider.notifier)
                    .setEvent(UpdateTodo(effect.todo, result));
              }
            }
        }
      });
    });
  }

  Widget _homeDialog(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final images = ref.watch(imageProvider);
        return Container(
          width: double.infinity,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TextField(
                onChanged: (query) =>
                    ref.read(imageProvider.notifier).onChangeQuery(query),
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
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    final image = images[index];
                    return GestureDetector(
                      onTap: () => context.pop(image),
                      child: Image.network(
                        width: 30,
                        height: 30,
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: const Text(
            '오늘 할일',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: HomeBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: FloatingActionButton(
          onPressed: () => {viewModel.setEvent(OnClickAddTodo())},
          child: Center(child: const Icon(Icons.add)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
