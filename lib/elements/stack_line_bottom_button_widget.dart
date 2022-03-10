import 'package:flutter/material.dart';

class BottomLineButtonWidget extends StatelessWidget {
  const BottomLineButtonWidget({Key key, @required this.color, @required this.text, @required this.onPressed}) : super(key: key);

  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Divider()),
            FlatButton(
              onPressed: onPressed,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              color: Colors.black12,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15, height: 1.2,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'))),
            Expanded(
              child: Divider()),
          ],
        )
      );
  }
}