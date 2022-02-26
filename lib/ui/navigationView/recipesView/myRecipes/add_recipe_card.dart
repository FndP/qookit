import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double sideLength = MediaQuery.of(context).size.width/2-32;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          width:  sideLength,
          height: sideLength,
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.amber,
              width: 2,
            )
          ),
          child: Center(
            child: Icon(Icons.add,
            color: Colors.amber,
            size: 48,),
          ),
        ),
        Text('Add New Recipe',
        style: GoogleFonts.lato(
          color: Colors.amber,
          fontWeight: FontWeight.w600
        ),),
      ],
    );
  }
}
