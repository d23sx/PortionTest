import 'package:flutter/cupertino.dart';

class Cart {
  late final int? id;
  final String? itemId;
  final String? itemName;
  final String? itemImage;
  final int? itemPrice;
  final ValueNotifier<int>? quantity;
  Cart({
    this.id,
    this.itemId,
    this.itemName,
    this.itemImage,
    this.itemPrice,
    this.quantity,
  });
  Cart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        itemId = data['itemId'],
        itemName = data['itemName'],
        itemImage = data['itemImage'],
        itemPrice = data['itemPrice'],
        quantity = ValueNotifier(data['quantity']);
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'itemImage': itemImage,
      'itemPrice': itemPrice,
      'quantity': quantity?.value,
    };
  }

  Map<String, Object?> quantityMap() {
    return {
      'itemId': itemId,
      'quantity': quantity!.value,
    };
  }
}
