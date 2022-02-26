import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/pantryView/pantryCatalog/pantryCatalogWidgets/pantry_catalog_header.dart';

class FlexiblePantryCatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: null,
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      elevation: 4,
      pinned: true,
      floating: true,
      flexibleSpace: PantryCatalogHeader(),
      bottom: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Add Pantry Items',
          suffixIconConstraints: BoxConstraints.loose(Size(30,30)),
          contentPadding: EdgeInsets.symmetric(horizontal: 8
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none)
        )
      )),
      backgroundColor: Colors.white,
      stretch: true,
      snap: true,
    );
  }
}
