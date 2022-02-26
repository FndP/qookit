import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeSearch/recipeSearchWidgets/search_label.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeSearch/recipe_search_view_model.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipe_card.dart';
import 'package:qookit/ui/navigationView/recipesView/recipeWidgets/recipes_search_header.dart';
import 'package:stacked/stacked.dart';

class RecipeSearchView extends StatelessWidget {
  final String searchTerm;

  const RecipeSearchView({Key key, this.searchTerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeSearchViewModel>.reactive(
        viewModelBuilder: () => RecipeSearchViewModel(),
        onModelReady: (model) {
          RecipeSearchViewArguments arg = ModalRoute.of(context).settings.arguments;
          model.initializeModel(arg?.searchTerm);
        },
        builder: (context, model, child) {
          if (!model.isBusy) {
            print('Future data: ' + model.data.toString());
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      expandedHeight: 200,
                      flexibleSpace: RecipesSearchHeader(),
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                    ),
                    SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: .9),
                        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                          return RecipeCard(
                            recipe: model.data[index],
                          );
                        }, childCount: model.data.length))
                  ],
                ),
                DraggableScrollableSheet(
                  initialChildSize: .08,
                  maxChildSize: 1.0,
                  minChildSize: .08,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black45, offset: Offset(1, 1), blurRadius: 2)],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        controller: scrollController,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  height: 10,
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Filter',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          for (FilterGroup group in model.categories)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SearchLabel(label: group.label),
                                GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 4,
                                  children: [
                                    for (String filter in group.filters) Row(
                                      children: [
                                        Checkbox(value: false, onChanged: null),
                                        Text(filter),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}