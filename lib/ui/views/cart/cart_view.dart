import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../common/text_style.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Cart",
          style: FontStyles.header2,
        ),
        backgroundColor: kcBackgroundColor,
        leading: IconButton(
            onPressed: () {
              CartViewModel.getBackToHomePage();
            },
            icon: Image.asset("assets/icons/Frame-6.png",
                color: kcEazyBlueColor)),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: kcLightGrey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.asset("assets/img/cappuccino.jpg",
                                height: 60),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cappuccino",
                                  style: FontStyles.title2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                verticalSpaceSmall,
                                Text(
                                  "BHD 1.9",
                                  style: FontStyles.body
                                      .copyWith(color: kcEazyBlueColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 16,
                                )),
                          ),
                          horizontalSpaceSmall,
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        "assets/icons/Frame-3.png",
                                        color: kcEazyBlueColor)),
                              ),
                              const Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 16, color: kcEazyBlueColor),
                              ),
                              SizedBox(
                                height: 30,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        "assets/icons/Frame-4.png",
                                        color: kcEazyBlueColor)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 270,
              child: Container(
                height: 320,
                width: screenWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26)),
                    color: kcEazyBlueColor.withOpacity(0.09)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Info",
                          style: FontStyles.header2,
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subtotal",
                              style: FontStyles.title2,
                            ),
                            Text(
                              "BHD 1.9",
                              style: FontStyles.title1,
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery fee",
                              style: FontStyles.title2,
                            ),
                            Text(
                              "BHD 1.9",
                              style: FontStyles.title1,
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount",
                              style: FontStyles.title2,
                            ),
                            Text(
                              "BHD 1.9",
                              style: FontStyles.title1,
                            ),
                          ],
                        ),
                        spacedDivider,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: FontStyles.title2,
                            ),
                            Text(
                              "BHD 1.9",
                              style: FontStyles.title1,
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: kcEazyBlueColor,
                              elevation: 1,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                            ),
                            child: const Text("Checkout",
                                style: TextStyle(
                                  color: kcVintageCreamColor,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
