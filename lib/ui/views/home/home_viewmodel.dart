import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
class HomeViewModel extends BaseViewModel {
  static BuildContext? tabContext;

  static List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
/*
  static ScrollController? _scrollController;

  static ScrollController get scrollController {
    _scrollController ??= ScrollController(); // Initialize if null
    return _scrollController!;
  }


  void animateToTab() {
    late RenderBox box;
    for (var i = 0; i < keys.length; i++) {
      box = keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(i, duration: const Duration(milliseconds: 100));
      }
    }
  }*/

}