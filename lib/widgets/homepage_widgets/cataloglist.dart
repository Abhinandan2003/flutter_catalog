// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:flutter_catalog/models/catalogs.dart';

import 'catalogimage.dart';
class catalogList extends StatelessWidget {
  const catalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogmodel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogmodel.items[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => homedetailpage(catalog: catalog
              ),
            ),
            ),
            child: catalogItem(catalog: catalog));
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: catalogImage(image: catalog.image)
            ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(context.theme.hintColor),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                   child: "Buy".text.make())
                ],
                

              ).pOnly(right: 8.0)
            ],
          ))
          
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
