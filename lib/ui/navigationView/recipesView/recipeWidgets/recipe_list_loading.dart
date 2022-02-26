import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeListLoadingIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}