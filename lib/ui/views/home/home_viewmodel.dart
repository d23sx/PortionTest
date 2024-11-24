import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oz_cafe/app/app.locator.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  static BuildContext? tabContext;
  static final _navigationService = locator<NavigationService>();
  static final GlobalKey keys = GlobalKey();
/*  static List<GlobalKey> keys = [
    GlobalKey(debugLabel: "Best Seller"),
    GlobalKey(debugLabel: "Drinks"),
    GlobalKey(debugLabel: "Desert"),
    GlobalKey(debugLabel: "Breakfast"),
    GlobalKey(debugLabel: "Meals"),
  ];*/
  static Future<void> goToDetailsPage(MenuData menuItemData) async {
    await _navigationService.navigateToItemDetailsView(menuItems: menuItemData);
  }

  static Future goToToCart() async {
    await _navigationService.replaceWithCartView();
  }
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
