import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/app/strings.dart';
import 'package:qookit/models/pantry_item.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryViewWidgets/give_it_a_try.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryViewWidgets/pantry_title.dart';
import 'package:qookit/ui/navigationView/pantryView/pantry_view_model.dart';
import 'package:stacked/stacked.dart';

class FlexiblePantry extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
      <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexiblePantryHeader(),
        )
      ],
      body: FlexiblePantryContent(),
    );
  }
}

class FlexiblePantryHeader extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return SliverAppBar(
      leading: null,
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      elevation: 4,
      pinned: true,
      floating: true,
      flexibleSpace: PantryHeader(),
      backgroundColor: Colors.white,
      stretch: true,
      snap: true,
      bottom: TabBar(
        labelStyle: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(text: 'ALL'),
          Tab(text: 'FRIDGE'),
          Tab(text: 'FREEZER'),
        ],
      ),
    );
  }
}

class PantryHeader extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          AnimatedOpacity(
            opacity: 1 * ((constraints.maxHeight - 48) / 200),
            duration: Duration(milliseconds: 0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: PantryTitle()),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              print('tapped');
                              ExtendedNavigator.named('nestedNav').push(NavigationViewRoutes.pantryCatalogView);
                            },
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: 'Add Pantry Items',
                                prefixIcon: Icon(
                                  Icons.add,
                                  size: 28,
                                ),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/barcode_icon.svg',
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints.loose(Size(30, 30)),
                                contentPadding: EdgeInsets.all(0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),

                        /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        'assets/images/barcode_icon.svg',
                        color: Colors.black,
                      ),
                    ),*/
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

class FlexiblePantryContent extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return TabBarView(
      children: [
        PantryList(
          pantryBox: hiveService.pantryListenable,
        ),
        PantryList(
          pantryBox: hiveService.fridgeListenable,
        ),
        PantryList(
          pantryBox: hiveService.freezerListenable,
        ),
      ],
    );
  }
}

class AllPantry extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return Builder(
      builder: (context) =>
          CustomScrollView(slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Strings.pantry,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

class FridgePantry extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return Center(
      child: Text('Fridge'),
    );
  }
}

class FreezerPantry extends ViewModelWidget<PantryViewModel> {
  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return Center(
      child: Text('Freezer'),
    );
  }
}

class PantryList extends ViewModelWidget<PantryViewModel> {
  final ValueListenable<Box<dynamic>> pantryBox;

  PantryList({this.pantryBox});

  @override
  Widget build(BuildContext context, PantryViewModel viewModel) {
    return Builder(
      builder: (context) =>
          CustomScrollView(slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            ValueListenableBuilder(valueListenable: pantryBox, builder: (context, box, child) {
              if (pantryBox.value.keys.isEmpty) {
                return SliverToBoxAdapter(
                  child: GiveItATry(),
                );
              }
             // for(String cat in viewModel.categories)
              else if (pantryBox.value.keys.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    //String itemName = box.keys.elementAt(index);
                    return ListTileTheme(
                          tileColor: Colors.grey.shade300,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(viewModel.categories[index].toUpperCase(),
                              style: Theme.of(context).textTheme.headline5
                                ,),
                            ),
                            title: null,
                            children: [
                              for(PantryItem item in pantryBox.value.values.where((element) {
                                var item = element as PantryItem;
                                return item.category.toLowerCase() == viewModel.categories[index].toLowerCase();
                              }))

                              Slidable(
                                actionPane: SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    color: Color(0xffBE3944),
                                    icon: Icons.favorite_border,
                                    onTap: () => print('Favorite'),
                                  ),
                                  IconSlideAction(
                                    color: Color(0xff720000),
                                    icon: Icons.delete_outline,
                                    onTap: () => print('Delete'),
                                  )
                                ],
                                child: ListTileTheme(
                                  tileColor: Colors.white,
                                  child: ListTile(
                                    title: Text(item.name,
                                    style: Theme.of(context).textTheme.headline6,),
                                    subtitle: Text('WHOLEFOODS * EXP 9/24'),
                                    leading: FlutterLogo(),
                                    trailing: Text(
                                        '1 bag'), //Text(item.expiryGroups.first.quantity.toString() + ' ' + item.expiryGroups.first.unit),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                  }, childCount: viewModel.categories.length)
                  ,
                );
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            })
          ])
    );
  }
}