import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/text_style.dart';
import 'package:stacked/stacked.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';

import '../home/home_view.dart';
import '../location/location_view.dart';
import '../profile/profile_view.dart';
import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StackedView<BottomNavViewModel> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kcLightGrey,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "`Home`",
              icon: Image.asset("assets/icons/Group 2.png"),
            ),
            BottomNavigationBarItem(
              label: "Location",
              icon: Image.asset("assets/icons/Frame-1.png"),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Image.asset("assets/icons/Frame-2.png"),
            ),
          ],
        ),
        body: getViewForIndex(viewModel.currentIndex));
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const LocationView();
      case 2:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  BottomNavViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavViewModel();
}
