import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryViewWidgets/pantry_title.dart';

class PantryCatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PantryTitle(),
        ],
      ),
    );
  }
}
