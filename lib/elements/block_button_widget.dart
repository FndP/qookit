import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({Key key, @required this.color, @required this.text, @required this.onPressed})
      : super(key: key);

  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Container(
              width: 250,
              height: 45,
              margin: EdgeInsets.only(left: 5, right: 0),
              child:  Container(
                decoration: BoxDecoration(
                    color: Colors.amber, border: Border.all(color: Colors.white
                )),
                width: 250,
                height: 45,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
            onTap: (){
              onPressed.call();
            },
          )
        ],
      );
  }
}
