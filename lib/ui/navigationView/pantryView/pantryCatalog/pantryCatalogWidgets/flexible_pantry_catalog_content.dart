import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantryCatalogWidgets/category_card.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantry_catalog_view_model.dart';
import 'package:stacked/stacked.dart';

class FlexiblePantryCatalogContent extends ViewModelWidget<PantryCatalogViewModel> {
  @override
  Widget build(BuildContext context, PantryCatalogViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverGrid(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
            return CategoryCard(category: viewModel.categories[index]);
          },
          childCount: viewModel.categories.length),
        )
      ],
    );
  }

}
