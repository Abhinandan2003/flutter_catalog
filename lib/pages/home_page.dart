// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, prefer_typing_uninitialized_variables, unused_import, unrelated_type_equality_checks
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/homepage_widgets/cataloglist.dart';
import '../widgets/homepage_widgets/columhome.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogjson);
    var productData = decodedData["products"];
    catalogmodel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation , RemoveMutation},
        builder:(context , _ , __)=> FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Myroutes.cartpageroute),
          backgroundColor: context.theme.hintColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(color: Vx.red500 , size: 22, count: _cart.items.length ,textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          
        
        )),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                columnheader(),
                if (catalogmodel.items.isNotEmpty)
                  catalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().expand(),
                  )
              ],
            )),
      ),
    );
  }
}
