import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  late catalogmodel catalog;
  late  CartModel cart;

  Mystore(){
   catalog = catalogmodel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
