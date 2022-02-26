import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantryCatalogWidgets/flexible_pantry_catalog.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view_model.dart';
import 'package:stacked/stacked.dart';

class PantryCatalogView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PantryCatalogViewModel>.reactive(
        viewModelBuilder: () => PantryCatalogViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(child: FlexiblePantryCatalog()),
          );
        },);
  }
}
