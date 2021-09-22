import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/res/icons.dart';

class PlaceHolderScreen extends StatelessWidget {
  final String title;
  const PlaceHolderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(title: title),
      body: Center(
        child: SvgPicture.asset(LIcons.liquid, width: 80),
      ),
    );
  }
}
