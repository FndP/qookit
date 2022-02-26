import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qookit/ui/navigationView/shoppingView/shoppingItemView/shopping_item_view_model.dart';
import 'package:stacked/stacked.dart';

class ShoppingItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShoppingItemViewModel>.reactive(
      viewModelBuilder: () => ShoppingItemViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: Scaffold(
                body: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) =>
                        <Widget>[
                          SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverAppBar(
                              leading: null,
                              automaticallyImplyLeading: false,
                              expandedHeight: 200,
                              elevation: 4,
                              pinned: true,
                              floating: true,
                              flexibleSpace: LayoutBuilder(
                                builder: (context, constraints) =>
                                    AnimatedOpacity(
                                  opacity:
                                      1 * ((constraints.maxHeight - 48) / 200),
                                  duration: Duration(milliseconds: 0),
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                            child: Hero(
                                          tag: 'pantry',
                                          child: Row(
                                            children: [
                                              Text(
                                                'Pantry',
                                                style: TextStyle(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: TextField(
                                                    enabled: false,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.grey.shade200,
                                                      filled: true,
                                                      hintText: 'Add Pantry Items',
                                                      prefixIcon: Icon(
                                                        Icons.add,
                                                        size: 28
                                                      ),
                                                      suffixIcon: Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/barcode_icon.svg',
                                                          color: Colors.black,
                                                        )
                                                      ),
                                                      suffixIconConstraints:
                                                          BoxConstraints.loose(
                                                              Size(30, 30)),
                                                      contentPadding: EdgeInsets.all(0),
                                                      border:
                                                          OutlineInputBorder(
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
                              ),
                              backgroundColor: Colors.white,
                              stretch: true,
                              snap: true,
                              bottom: TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Colors.amber,
                                labelColor: Colors.amber,
                                labelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w600),
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'ALL'),
                                  Tab(text: 'FRIDGE'),
                                  Tab(text: 'FREEZER'),
                                ],
                              ),
                            ),
                          )
                        ],
                    body: Builder(
                      builder: (context) => CustomScrollView(slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return ListTileTheme(
                                  tileColor: Colors.grey.shade300,
                                  child: ExpansionTile(
                                    initiallyExpanded: true,
                                    leading: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text('PRODUCE'),
                                    ),
                                    title: null,
                                    children: [
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
                                            title: Text('Gala Apples'),
                                            subtitle:
                                                Text('WHOLEFOODS * EXP 9/24'),
                                            leading: FlutterLogo(),
                                            trailing: Text('1 bag'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                          }, childCount: 20),
                        )
                      ]),
                    ))));
      },
    );
  }
}
