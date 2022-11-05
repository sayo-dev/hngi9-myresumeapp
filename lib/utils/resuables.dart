import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:rezumi/utils/size_config.dart';

class kText extends StatelessWidget {
  final String text;
  final double size;
  final String family;
  kText({required this.text, required this.size, required this.family});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return LocaleText(
      text,
       localize: false,
      style: TextStyle(
          fontSize: getProportionateScreenWidth(size),
          fontFamily: family
      ),
    );
  }
}