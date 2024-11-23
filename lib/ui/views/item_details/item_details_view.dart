import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:oz_cafe/ui/common/text_style.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

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
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcBackgroundColor,
        leading: IconButton(
            onPressed: () {
              ItemDetailsViewModel.getBackToHomePage();
            },
            icon: Image.asset("assets/icons/Frame-6.png",height: 22,color: kcEazyBlueColor)),
        actions: [
          IconButton(
              onPressed: () {ItemDetailsViewModel.goToToCart();}, icon: Image.asset("assets/icons/Frame-5.png",height: 22,color: kcEazyBlueColor,)),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/Frame-8.png",height: 22,color: kcEazyBlueColor,)),
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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: kcEazyBlueColor,
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      /*side: BorderSide(
                      color: colorScheme.primary,
                      width: 5,
                    ),*/
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
