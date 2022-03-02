import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/ui/navigationView/navigation_view_model.dart';
import 'package:stacked/stacked.dart';

OverlayEntry showFabActions(BuildContext context, NavigationViewModel model) {
  RenderBox renderBox = context.findRenderObject();
  var size = renderBox.size;
  var offset = renderBox.localToGlobal(Offset.zero);

  return OverlayEntry(builder: (context) {
    double step = 100;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            child: Container(
              color: Colors.grey,
            ),
            opacity: .5,
          )),
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: cancelFab(model),
          ),
          Positioned(
            left: offset.dx - step,
            top: offset.dy - step / 2,
            child: fabOption(
                size, 'pantry', 'assets/images/pantry_icon.svg', model,startDemo: 0),
          ),
          Positioned(
            left: offset.dx - step / 2 + size.width / 4,
            top: offset.dy - step,
            child: fabOption(
                size, 'recipe', 'assets/images/utensils_icon.svg', model,startDemo: 2),
          ),
          Positioned(
            left: offset.dx + step / 2 - size.width / 4,
            top: offset.dy - step,
            child:
                fabOption(size, 'dish', 'assets/images/dish_icon.svg', model,startDemo: 1),
          ),
          Positioned(
            left: offset.dx + step,
            top: offset.dy - step / 2,
            child: fabOption(
                size, 'receipt', 'assets/images/receipt_icon.svg', model,startDemo: 3),
          ),
        ],
      ),
    );
  });
}

Widget cancelFab(NavigationViewModel model) {
  return Material(
    color: Colors.transparent,
    child: FloatingActionButton(
      child: Icon(
        Icons.clear,
        color: Colors.black,
      ),
      backgroundColor: Colors.amber,
      onPressed: () {
        model.updateOverlay(false);
        model.fabOverlay.remove();
      },
    ),
  );
}

Widget fabOption(
    Size size, String label, String assetIcon, NavigationViewModel model, {int startDemo = 0}) {
  return Material(
    color: Colors.transparent,
    child: Builder(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: SvgPicture.asset(
              assetIcon,
              color: Colors.black45,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              // Navigate to camera, send scan type with navigation
              model.updateOverlay(false);
              model.fabOverlay.remove();

              ExtendedNavigator.named('nestedNav').push(NavigationViewRoutes.cameraView);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
//2000 + 660 = 2660 -