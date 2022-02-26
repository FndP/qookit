import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantryCatalogWidgets/flexible_pantry_catalog_content.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantryCatalogWidgets/flexible_pantry_catalog_header.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view_model.dart';
import 'package:stacked/stacked.dart';

class FlexiblePantryCatalog extends ViewModelWidget<PantryCatalogViewModel> {

  @override
  Widget build(BuildContext context, PantryCatalogViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexiblePantryCatalogHeader(),
        )
      ],
      body: FlexiblePantryCatalogContent(),
    );
  }

}