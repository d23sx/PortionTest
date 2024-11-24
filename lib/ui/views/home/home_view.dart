import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../common/app_colors.dart';
import '../../common/text_style.dart';
import '../../common/ui_helpers.dart';
import '../cart/cart_view.dart';
import '../item_details/item_details_viewmodel.dart';
import 'home_viewmodel.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final provider = ItemDetailsViewModel.of(context);
    print("Cart Length 2: ${provider.cart.length}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: kcBackgroundColor,
            title: Text(
              "Hello, Aqeel",
              style: FontStyles.header3,
            ),
            //flexibleSpace: Center(child: SizedBox(width: 26,height:26,child: Image.asset("assets/logos/Oz - Logo & Slogan - Blue on Transparent 1.png"))),
            actions: [
              badges.Badge(
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: kcEazyBlueColor),
                position: badges.BadgePosition.topEnd(top: -3, end: 2),
                badgeContent:  Text(
                  "${provider.cart.length}",
                  style: const TextStyle(color: Colors.white),
                ),
                badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(milliseconds: 300)),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartView()),
                    );
                  },
                  icon: Image.asset(
                    "assets/icons/Frame-5.png",
                    color: kcEazyBlueColor,
                    height: 22,
                  ),
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
                  Container(
                    height: 44,
                    width: 331,
                    decoration: BoxDecoration(
                      color: kcLightEazyBlueColor,
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
                          length: 5,
                          child: Column(
                            children: [
                              ButtonsTabBar(
                                key: HomeViewModel.keys,
                                unselectedBackgroundColor:
                                kcLightEazyBlueColor,
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
                                child: /*viewModel.hasError?
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                    : */
                                    TabBarView(
                                  children: [
                                    _buildMenuItemsList(
                                        MenuRepository.bestSeller),
                                    _buildMenuItemsList(MenuRepository.drinks),
                                    _buildMenuItemsList(
                                        MenuRepository.desserts),
                                    _buildMenuItemsList(
                                        MenuRepository.breakfast),
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
                ],
              ),
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
      shrinkWrap: true,
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
