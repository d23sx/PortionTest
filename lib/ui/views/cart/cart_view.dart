import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';
import 'package:oz_cafe/ui/views/item_details/item_details_viewmodel.dart';
import 'package:provider/provider.dart';
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
    final provider = Provider.of<ItemDetailsViewModel>(context);
    print("Cart Length 1: ${provider.cart.length}");
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
            CartViewModel.getBackToPreviousPage();
          },
          icon: Image.asset("assets/icons/Frame-6.png", color: kcEazyBlueColor),
        ),
      ),
      body: !provider.checkCart()
          ? Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Text(
            "${provider.cart.length} Products in your Cart!!",
            style: FontStyles.header1,
          ),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 420,
              child: ListView.builder(
                itemCount: provider.cart.length,
                itemBuilder: (BuildContext context, int index) {
                  print("Cart Length 2: ${provider.cart.length}");
                  final cartItem = provider.cart[index];
                  return Container(
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
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  child: cartItem.itemImage.isNotEmpty
                                      ? Image.asset(cartItem.itemImage, height: 60)
                                      : Image.asset("assets/img/empty.jpg", height: 60),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 70,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          cartItem.itemName,
                                          style: FontStyles.title2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        verticalSpaceSmall,
                                        Text(
                                          "BHD ${cartItem.itemPrice}",
                                          style: FontStyles.body.copyWith(color: kcEazyBlueColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      provider.removeItem(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: IconButton(
                                        onPressed: () {
                                          provider.incrementQtn(index);
                                        },
                                        icon: Image.asset("assets/icons/Frame-3.png", color: kcEazyBlueColor),
                                      ),
                                    ),
                                    Text(
                                      "${cartItem.itemQuantity}",
                                      style: const TextStyle(fontSize: 16, color: kcEazyBlueColor),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: IconButton(
                                        onPressed: () {
                                          provider.decrementQtn(index);
                                        },
                                        icon: Image.asset("assets/icons/Frame-4.png", color: kcEazyBlueColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            verticalSpaceMedium,
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                color: kcLightEazyBlueColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                          "BHD ${provider.subTotal.toString()}",
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
                          "BHD ${provider.delivery.toString()}",
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
                          "BHD ${provider.discount.toString()}",
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
                          "BHD ${provider.totalPrice().toString()}",
                          style: FontStyles.title1,
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {provider.showDialog();},
                          color: kcEazyBlueColor,
                          elevation: 1,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),

                        child: const Text(
                          "Checkout",
                          style: TextStyle(
                            color: kcVintageCreamColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}