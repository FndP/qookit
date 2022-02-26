import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantry_view_model.dart';
import 'package:qookit/ui/navigationView/pantryView/pantry_view_widgets.dart';
import 'package:stacked/stacked.dart';

class PantryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PantryViewModel>.reactive(
      viewModelBuilder: () => PantryViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: DefaultTabController(
          length: 3,
          child: Scaffold(body: FlexiblePantry()),
        ));
      },
    );
  }
}
