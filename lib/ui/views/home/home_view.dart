import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../common/app_colors.dart';
import '../../common/text_style.dart';
import '../../common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
          backgroundColor: kcBackgroundColor,
          title: Text(
            "Hello, Aqeel",
            style: FontStyles.header3,
          ),
          actions: [
            IconButton(
              onPressed: () {
                HomeViewModel.goToToCart();
              },
              icon: Image.asset(
                "assets/icons/Frame-5.png",
                color: kcEazyBlueColor,
                height: 22,
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceMedium,
                Container(
                  height: 44,
                  width: 331,
                  decoration: BoxDecoration(
                    color: kcEazyBlueColor.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Your remaining points: 120 points",
                      style: FontStyles.title2,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  height: 180,
                  width: 331,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset("assets/icons/Banner.png"),
                ),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Builder(
                    builder: (context) {
                      HomeViewModel.tabContext = context;
                      return DefaultTabController(
                        length: HomeViewModel.keys.length,
                        child: Column(
                          children: [
                            ButtonsTabBar(
                              key: HomeViewModel.keys[0],
                              unselectedBackgroundColor:
                                  kcEazyBlueColor.withOpacity(0.09),
                              unselectedLabelStyle:
                                  const TextStyle(color: kcEazyBlueColor),
                              backgroundColor: kcEazyBlueColor,
                              labelStyle:
                                  const TextStyle(color: kcVintageCreamColor),
                              radius: 24,
                              height: 45,
                              contentPadding: const EdgeInsets.all(10),
                              contentCenter: true,
                              tabs: const [
                                Tab(text: "Best Seller"),
                                Tab(text: "Drinks"),
                                Tab(text: "Dessert"),
                                Tab(text: "Breakfast"),
                                Tab(text: "Meals"),
                              ],
                            ),
                            verticalSpaceTiny,
                            SizedBox(
                              height: 500,
                              child: /*HomeView.hasError?
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                  : */
                                  TabBarView(
                                children: [
                                  _buildMenuItemsList(
                                      MenuRepository.bestSeller),
                                  _buildMenuItemsList(MenuRepository.drinks),
                                  _buildMenuItemsList(MenuRepository.desserts),
                                  _buildMenuItemsList(MenuRepository.breakfast),
                                  _buildMenuItemsList(MenuRepository.meals),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                verticalSpaceMedium,
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemContainer(MenuData menuItem) {
    return GestureDetector(
      onTap: () async {
        await HomeViewModel.goToDetailsPage(menuItem);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 200,
          width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuItem.itemImage.isNotEmpty
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        width: 160,
                        height: 140,
                        menuItem.itemImage,
                        fit: BoxFit.cover,
                      ))
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        width: 160,
                        height: 140,
                        "assets/img/empty.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  menuItem.itemName,
                  style: FontStyles.title2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  "BHD ${menuItem.itemPrice.toString()}",
                  style: FontStyles.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemsList(List<MenuData> categories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 5,
          childAspectRatio: 0.6),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildMenuItemContainer(categories[index]);
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
