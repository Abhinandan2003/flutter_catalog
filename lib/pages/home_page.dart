// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, prefer_typing_uninitialized_variables, unused_import, unrelated_type_equality_checks
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
      backgroundColor: mytheme.creamcolor,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                columnheader(),
                if (catalogmodel.items.isNotEmpty)
                  catalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            )),
      ),
    );
  }
}

class columnheader extends StatelessWidget {
  const columnheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog app".text.xl5.bold.color(mytheme.darkbluish).make(),
      "Trending Gdgets".text.xl2.make(),
    ]);
  }
}

class catalogList extends StatelessWidget {
  const catalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogmodel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogmodel.items[index];
          return catalogItem(catalog: catalog);
        });
  }
}

class catalogItem extends StatelessWidget {
  final Item catalog;

  const catalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          catalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              catalog.name.text.lg.color(mytheme.darkbluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mytheme.darkbluish),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                   child: "Buy".text.make())
                ],
                

              ).pOnly(right: 8.0)
            ],
          ))
          
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class catalogImage extends StatelessWidget {
  const catalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
          ).box.rounded.p8.color(mytheme.creamcolor).make().p16().w40(context);
  }
}
