// ignore_for_file: unnecessary_getters_setters

import 'package:flutter_catalog/models/catalogs.dart';

class CartModel {
   static final cartmodel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartmodel;

  late catalogmodel _catalog;

  final List<int> _itemIds = [];

  catalogmodel get catalog => _catalog;

  set catalog(catalogmodel newcatalog) {
    _catalog = newcatalog;
  }
  //get items in cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
