import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomSheet extends ConsumerWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _datetimeTop(),
        _datetimeTop(),
        _datetimeTop(),
        _datetimeTop()
      ]),
    );
  }

  Widget _datetimeTop() {
    return Text('z');
  }
}
