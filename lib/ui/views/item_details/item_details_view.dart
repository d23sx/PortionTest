import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:oz_cafe/ui/common/text_style.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';
import 'package:oz_cafe/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:oz_cafe/ui/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:badges/badges.dart' as badges;

import '../cart/cart_view.dart';
import '../cart/cart_viewmodel.dart';
import 'item_details_viewmodel.dart';

class ItemDetailsView extends StackedView<ItemDetailsViewModel> {
  final MenuData menuItems;
  const ItemDetailsView(this.menuItems, {Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    ItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    final provider = Provider.of<ItemDetailsViewModel>(context);
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcBackgroundColor,
        leading: IconButton(
            onPressed: () {
              /// i used the following navigation function because i had problem navigating between the item detail page and back to the home screen,
              /// for instance to add more items to the cart when using the stacked framework navigation functions while maintaining the cart content, it would always empty the cart.
              /// Also, even with using different options of navigation some i had problem that the page would be disposed,
              /// for instance, i can't go to the same item  if i want to view it again (A ItemDetailsViewModel was used after being disposed.). still learning how navigation works in a stacked framework.
              //ItemDetailsViewModel.getBackToPreviousPage();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavView()),
              );
            },
            icon: Image.asset("assets/icons/Frame-6.png",
                height: 22, color: kcEazyBlueColor)),
        actions: [
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: kcEazyBlueColor),
            position: badges.BadgePosition.topEnd(top: -3, end: 2),
            badgeContent: Text(
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
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/Frame-8.png",
                height: 22,
                color: kcEazyBlueColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              Center(
                child: Text(
                  menuItems.itemName,
                  style: FontStyles.header2,
                ),
              ),
              verticalSpaceMedium,
              Center(
                child: menuItems.itemImage.isNotEmpty
                    ? ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          menuItems.itemImage,
                          fit: BoxFit.cover,
                        ))
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          "assets/img/empty.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              verticalSpaceMedium,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price: ",
                    style: FontStyles.header3,
                  ),
                  Text(
                    "BHD ${menuItems.itemPrice}",
                    style: FontStyles.title1,
                  )
                ],
              ),
              verticalSpaceMedium,
              Text(
                "Description",
                style: FontStyles.header3,
              ),
              Text(
                menuItems.itemDescription,
                style: FontStyles.body,
              ),
              verticalSpaceLarge,
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    provider.addTOCart(menuItems);
                    print("Item Added To The Cart");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kcEazyBlueColor,
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  child: const Text("Add to cart",
                      style: TextStyle(
                        color: kcVintageCreamColor,
                        fontSize: 20,
                      )),
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ItemDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ItemDetailsViewModel();
}
