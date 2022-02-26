import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qookit/tflite/recognition.dart';

class BoundingBox extends StatelessWidget {

  final Recognition obj;

  const BoundingBox({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   /* print('left: '+ obj.location.left.toString());
    print('right: '+ obj.location.right.toString());
    print('bottom: '+ obj.renderLocation.bottom.toString());
    print('top: '+ obj.renderLocation.top.toString());*/

    return AnimatedPositioned(
      left: obj.renderLocation.left,
      //right: obj.renderLocation.right,
      //bottom: obj.renderLocation.bottom,
      width: obj.renderLocation.width,
      height: obj.renderLocation.height,
      top: obj.renderLocation.top,
      duration: Duration(milliseconds: 200),
      child: SizedOverflowBox(
        size: Size(
          300,400
        ),
        child: DottedBorder(
          radius: Radius.circular(8),
          borderType: BorderType.RRect,
          child: Container(),
          color: Colors.amber,
          strokeWidth: 4,
        ),
      )

      /*SvgPicture.asset(
        'assets/images/scan.svg',
        color: Colors.amber,
        fit: BoxFit.fill,
      ),*/
    );
  }
}
