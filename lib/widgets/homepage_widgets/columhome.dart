import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/theme.dart';

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