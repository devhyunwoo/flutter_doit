import 'dart:async';

import 'package:doit_app/ui/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageNotifier extends AutoDisposeNotifier<List<String>> {
  Timer? _debounce;

  @override
  List<String> build() {
    return <String>[];
  }

  Future<void> onChangeQuery(String query) async {
    _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 300), () async {
      final images = await ref.read(apiRepositoryProvider).searchImage(query);
      state = images.items.map((item) => item.link).toList();
    });
  }
}
