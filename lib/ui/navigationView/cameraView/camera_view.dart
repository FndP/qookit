import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qookit/models/pantry_item.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/ui/navigationView/cameraView/cameraWidgets/bounding_box.dart';
import 'package:qookit/ui/navigationView/cameraView/cameraWidgets/camera_preview_widget.dart';
import 'package:qookit/ui/navigationView/cameraView/cameraWidgets/object_label.dart';
import 'package:qookit/ui/navigationView/cameraView/camera_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:qookit/tflite/recognition.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _loadModel;

    return ViewModelBuilder<CameraViewModel>.reactive(
        viewModelBuilder: () => CameraViewModel(),
        onModelReady: (model) => model.initialize(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              context: context,
              startDemo: ModalRoute.of(context).settings.arguments,
            ),
        builder: (context, model, child) {
          print('building again');
          _loadModel ??= model.loadModel();

          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            key: model.scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: SvgPicture.asset(
                'assets/images/qookit_full.svg',
                color: Colors.white,
              ),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios_outlined),
              ),
              backgroundColor: Colors.transparent,
              actions: [
                // TODO: Remove demo
                IconButton(
                    icon: Icon(Icons.android),
                    onPressed: () {
                      // Go to demo
                      //Navigator.of(context).pushNamed(CameraDemo.id);
                      model.demo = !model.demo;
                      if (model.demo) {
                        // model.cameraController.dispose();
                      } else {
                        model.initializeCamera(context);
                      }
                      model.notifyListeners();
                    })
              ],
            ),
            body: FutureBuilder(
                future: _loadModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        SafeArea(
                          child: Stack(
                            children: [
                              Container(
                                  /*width: model.screenWidth,
                                  height: model.screenHeight,*/
                                  child: cameraPreviewWidget()),
                              //Positioned.fill(child: boundingBoxes(model.results)),
                              for (Recognition obj in model.results)
                                BoundingBox(
                                  obj: obj,
                                ),
                              for (Recognition obj in model.results)
                                ObjectLabel(
                                  obj: obj,
                                )
                            ],
                          ),
                        ),
                        DraggableScrollableSheet(
                          maxChildSize: .6,
                          minChildSize: .05,
                          initialChildSize: .05,
                          expand: true,
                          builder: (context, scrollController) {
                            return Container(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  )),
                              child: ListView(
                                controller: scrollController,
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        )),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(2)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Items Detected',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Divider(
                                    height: 2,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (Recognition obj in model.results)
                                        Card(
                                          elevation: 4,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [Text(obj.label), IconButton(icon: Icon(Icons.clear), onPressed: () {})],
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: RaisedButton(
                                      color: Colors.white30,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      onPressed: () {
                                        //TODO: add ingredient
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 18,
                                          ),
                                          Text(
                                            'Add Ingredient',
                                            style: TextStyle(fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Add Items To',
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                        ),
                                        DropdownButton(
                                          value: model.destination,
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text('Pantry'),
                                              value: 'pantry',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Fridge'),
                                              value: 'fridge',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Freezer'),
                                              value: 'freezer',
                                            ),
                                          ],
                                          onChanged: (value) {
                                            model.destination = value;
                                            model.notifyListeners();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 24),
                                    child: RaisedButton(
                                      child: Text('ADD ITEMS'),
                                      color: Colors.amber,
                                      onPressed: () {
                                        // TODO: add items to selected destination
                                        model.detectedObjects.forEach((element) {
                                          var dummyItem = PantryItem(
                                            name: element.label,
                                            category: model.pantryCategories[Random().nextInt(model.pantryCategories.length - 1)],
                                            isFrozen: false,
                                            isRefrigerated: false,
                                            notes: element.label,
                                          );

                                          switch (model.destination) {
                                            case 'pantry':
                                              hiveService.pantryBox.put(element.label, dummyItem);
                                              break;
                                            case 'fridge':
                                              hiveService.fridgeBox.put(element.label, dummyItem);
                                              break;
                                            case 'freezer':
                                              hiveService.freezerBox.put(element.label, dummyItem);
                                              break;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: TextButton(
                                      child: Text('Clear All'),
                                      onPressed: () {
                                        // TODO: clear ingredients
                                        model.detectedObjects = [];
                                        model.notifyListeners();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        });
  }
}
