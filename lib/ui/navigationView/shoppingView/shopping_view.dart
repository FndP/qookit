import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/shoppingView/shoppingWidgets/flexible_shopping.dart';
import 'package:qookit/ui/navigationView/shoppingView/shopping_view_model.dart';
import 'package:stacked/stacked.dart';

class ShoppingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoppingViewModel>.reactive(
      viewModelBuilder: () => ShoppingViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(body: FlexibleShopping()),
            ));
      },
    );
  }
}