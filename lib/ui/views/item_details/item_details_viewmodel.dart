import 'package:flutter/cupertino.dart';
import 'package:oz_cafe/app/app.dialogs.dart';
import 'package:oz_cafe/app/app.router.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_data.dart';

class ItemDetailsViewModel extends BaseViewModel {
  static final _navigationService = locator<NavigationService>();
  static final ItemDetailsViewModel _instance =
      ItemDetailsViewModel._internal();

  factory ItemDetailsViewModel() {
    return _instance;
  }
  ItemDetailsViewModel._internal();
  final List<MenuData> _cart = [];
  List<MenuData> get cart => _cart;
  double totalCart = 0.0;
  double subTotal = 0.0;
  double discount = 0.0;
  double delivery = 0.0;

  totalPrice() {
    subTotal = 0.0;
    totalCart = 0.0;
    discount = 0.4;
    delivery = 0.6;
    for (MenuData element in _cart) {
      subTotal += element.itemPrice * element.itemQuantity;
      print("subTotal Price: ${subTotal.toStringAsFixed(1)}");
    }
    if (subTotal > 0) {
      totalCart = subTotal + delivery - discount;
      print("Total Price: ${totalCart.toStringAsFixed(1)}");
    }
    return totalCart.toStringAsFixed(1);
  }

  void addTOCart(MenuData menuData) {
    if (_cart.contains(menuData)) {
      for (MenuData element in _cart) {
        element.itemQuantity++;
        print("2: ${element.itemQuantity}");
        break;
      }
    } else {
      menuData.itemQuantity = 1;
      _cart.add(menuData);
      print("itemQuantity 1: ${menuData.itemQuantity}");
      print("itemName 1: ${menuData.itemName}");
    }
    totalPrice();
    rebuildUi();
  }

  bool checkCart() {
    if (cart.isEmpty) {
      return false;
    }
    return true;
  }

  removeItem(int index) {
    _cart.removeAt(index);
    totalPrice();
    rebuildUi();
  }

  incrementQtn(int index) {
    _cart[index].itemQuantity++;
    totalPrice();
    rebuildUi();
  }

  decrementQtn(int index) {
    _cart[index].itemQuantity--;
    print(
        "The ${_cart[index].itemName} is removed and has ${_cart[index].itemQuantity} 1: ");
    if (_cart[index].itemQuantity == 0) {
      print(
          "The ${_cart[index].itemName} is removed and has ${_cart[index].itemQuantity} 2: ");
      removeItem(index);
    }
    totalPrice();
    rebuildUi();
  }
  removeAll(){
    _cart.clear();
    rebuildUi();
  }
  final _dialogService = locator<DialogService>();
  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'You Proceeded to Checkout!',
      description: 'Enjoy Our Products',
    );
    print("Show");
    removeAll();
    rebuildUi();

  }
  static ItemDetailsViewModel of(BuildContext context, {bool listen = true}) {
    return Provider.of<ItemDetailsViewModel>(
      context,
      listen: listen,
    );
  }

  static Future getBackToPreviousPage() async {
    _navigationService.back();
    //_navigationService.replaceWith(Routes.bottomNavView);
    //_navigationService.previousRoute;
    // _navigationService.navigateTo(Routes.bottomNavView);
    //_navigationService.navigateToBottomNavView();
  }

  static Future goToToCart() async {
    await _navigationService.replaceWithCartView();
  }
}
