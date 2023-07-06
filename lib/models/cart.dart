// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_getters_setters

import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  





  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<Mystore> {
  final Item item;

  AddMutation(
    this.item,
  );
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<Mystore> {
  final Item item;

  RemoveMutation(this.item);

  
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
