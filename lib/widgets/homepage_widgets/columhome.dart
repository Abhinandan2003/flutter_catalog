// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class columnheader extends StatelessWidget {
  const columnheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog app".text.xl5.bold.color(Theme.of(context).colorScheme.secondary).make(),

      "Trending Gdgets".text.xl2.make(),
    ]);
  }
}