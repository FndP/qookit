import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/shoppingView/shoppingWidgets/shopping_compare.dart';
import 'package:qookit/ui/navigationView/shoppingView/shoppingWidgets/shopping_recipes.dart';
import 'package:qookit/ui/navigationView/shoppingView/shoppingWidgets/shopping_title.dart';
import 'package:qookit/ui/navigationView/shoppingView/shopping_view_model.dart';
import 'package:stacked/stacked.dart';

class FlexibleShopping extends ViewModelWidget<ShoppingViewModel> {
  @override
  Widget build(BuildContext context, ShoppingViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexibleShoppingHeader(),
        )
      ],
      body: FlexibleShoppingContent(),
    );
  }
}

class FlexibleShoppingHeader extends ViewModelWidget<ShoppingViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return SliverAppBar(
      leading: null,
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      elevation: 4,
      pinned: true,
      floating: true,
      flexibleSpace: ShoppingHeader(),
      backgroundColor: Colors.white,
      stretch: true,
      snap: true,
      bottom: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list, color: viewModel.screenMode == 'recipes'?Colors.amber:Colors.black45),
                  Flexible(
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: TextButton(
                          onPressed: (){
                            viewModel.updateScreenMode('recipes');
                          },
                            child: Text('RECIPES',style: TextStyle(
                                fontSize: 12,
                                color: viewModel.screenMode == 'recipes'?Colors.amber:Colors.black45
                            )),
                            )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.monetization_on_outlined, color: viewModel.screenMode == 'compare'?Colors.amber:Colors.black45),
                  Flexible(
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: TextButton(
                          onPressed: (){
                            viewModel.updateScreenMode('compare');
                          },
                          child: Text('COMPARE PRICES',
                          style: TextStyle(
                            fontSize: 12,
                              color: viewModel.screenMode == 'compare'?Colors.amber:Colors.black45
                          ),),
                        )),
                  ),
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.favorite_border, color: Colors.black45), onPressed: (){
              // TODO: Favorites
            }),
            IconButton(icon: Icon(Icons.share_outlined, color: Colors.black45), onPressed: (){
              // TODO: Share this
            })
          ],
        ),
      ),
    );
  }
}

class ShoppingHeader extends ViewModelWidget<ShoppingViewModel> {
  @override
  Widget build(BuildContext context, ShoppingViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedOpacity(
        opacity: 1 * ((constraints.maxHeight - 48) / 200),
        duration: Duration(milliseconds: 0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: ShoppingTitle()),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: TextField(
                          enabled: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Add Items',
                            prefixIcon: Icon(
                              Icons.add,
                              size: 28,
                            ),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlexibleShoppingContent extends ViewModelWidget<ShoppingViewModel> {
  @override
  Widget build(BuildContext context, ShoppingViewModel viewModel) {
    if(viewModel.screenMode == 'recipes'){
      return ShoppingRecipes();
    }
    else if(viewModel.screenMode == 'compare'){
      return ShoppingCompare();
    }
  }
}