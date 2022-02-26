import 'package:flutter/material.dart';
import 'package:qookit/services/theme/theme_service.dart';

class PantryTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'pantry',
      child: Row(
        children: [
          Text(
            'Pantry',
            style: headerStyle,
          ),
        ],
      ),
    );
  }
}
