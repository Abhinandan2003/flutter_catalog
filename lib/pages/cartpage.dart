// ignore_for_file: prefer_const_constructors, unused_element, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.xl3.bold.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
           notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, __){
            return "\$${_cart.totalprice}".text.xl4.color(context.accentColor).make();
          },), 
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.hintColor),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done_all_rounded),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.cart_fill_badge_minus),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
