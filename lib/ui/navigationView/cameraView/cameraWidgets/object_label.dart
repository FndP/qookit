import 'package:flutter/material.dart';
import 'package:qookit/models/detected_object.dart';
import 'package:qookit/tflite/recognition.dart';

class ObjectLabel extends StatelessWidget {

  final Recognition obj;

  const ObjectLabel({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: obj.renderLocation.left,
      top: obj.renderLocation.top + (obj.renderLocation.height + 8),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black45
        ),
        child: Text(obj.label,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
      ),
    );
  }
}
