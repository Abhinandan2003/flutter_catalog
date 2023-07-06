// ignore_for_file: camel_case_types, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:flutter_catalog/widgets/homepage_widgets/addtocart.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class homedetailpage extends StatelessWidget {
  final Item catalog ; 
    const homedetailpage({Key? key, required this.catalog}): super(key:key);
 
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child:  ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.make(),
                 AddtoCart(catalog: catalog) .wh(130, 50)
                ],
                

              ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
             child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                     catalog.name.text.xl4.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).xl.make(),
              10.heightBox,
              "Kind dry them green to replenish creepeth face is herb without day seas great, one. Good his gathered is day night sixth itself them grass wherein may life kind. Seed doesn't fill. Moved fourth yielding open one subdue to void man, green may greater saw blessed bring. Sea living Lights."
              .text
              .textStyle(context.captionStyle)
              .make()
              .p12()
                ],
              ).py64(),
             )))
          ],
        ),
      ),
    );
  }
}