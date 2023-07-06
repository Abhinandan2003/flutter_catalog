import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation , RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.hintColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
