import 'package:flutter/material.dart';
import 'package:qookit/tflite/recognition.dart';
import 'package:qookit/ui/navigationView/cameraView/tflite/box_widget.dart';

/// Returns Stack of bounding boxes
Widget boundingBoxes(List<Recognition> results) {
  if (results == null) {
    print('nothing');
    return Container();
  }
  return Stack(
    children: results
        .map((e) => BoxWidget(
      result: e,
    ))
        .toList(),
  );
}