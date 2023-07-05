// ignore_for_file: camel_case_types, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalogs.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class homedetailpage extends StatelessWidget {
  final Item catalog ; 
    const homedetailpage({Key? key, required this.catalog}): super(key:key);
 
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(),
      backgroundColor: mytheme.creamcolor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child:  ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.make(),
                  ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mytheme.darkbluish),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                   child: "Buy".text.xl.make()).wh(100, 50)
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
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                     catalog.name.text.xl4.color(mytheme.darkbluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).xl.make(),
              10.heightBox,
                ],
              ).py64(),
             )))
          ],
        ),
      ),
    );
  }
}