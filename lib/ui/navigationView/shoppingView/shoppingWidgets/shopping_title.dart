import 'package:qookit/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShoppingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'shopping',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shopping List',
            style: headerStyle,
          ),
          SvgPicture.asset('assets/images/cart_icon.svg')
        ],
      ),
    );
  }
}