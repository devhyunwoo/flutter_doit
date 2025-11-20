import 'package:doit_app/ui/bottom_nav/contract/effect/bottom_nav_effect.dart';
import 'package:doit_app/ui/bottom_nav/contract/event/bottom_nav_event.dart';
import 'package:doit_app/ui/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavLayout extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavLayout({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavLayoutState();
}

class _BottomNavLayoutState extends ConsumerState<BottomNavLayout> {
  @override
  void initState() {
    super.initState();
    ref.read(bottomNavViewModelProvider.notifier).effect.listen((effect) {
      switch (effect) {
        case NavigateToPage():
          switch (effect.pageIndex) {
            case 0:
              context.go('/home');
            case 1:
              context.go('/month');
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavViewModelProvider);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(
            label: 'Month',
            icon: Icon(Icons.calendar_month),
          ),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => ref
            .read(bottomNavViewModelProvider.notifier)
            .setEvent(OnTabItem(index)),
      ),
    );
  }
}
