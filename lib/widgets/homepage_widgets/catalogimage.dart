// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


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
          ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}