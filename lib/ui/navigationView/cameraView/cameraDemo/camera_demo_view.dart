import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qookit/ui/navigationView/cameraView/cameraDemo/camera_demo_view_model.dart';
import 'package:stacked/stacked.dart';

class CameraDemo extends StatelessWidget {
  static const String id = 'camera_demo';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CameraDemoViewModel>.reactive(
      viewModelBuilder: () => CameraDemoViewModel(),
      onModelReady: (model) {
        model.initialize(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
      },
      builder: (context, model, child) {

        return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Qookit'),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
          child: model.highlighting?Icon(Icons.clear):Icon(Icons.search),
          onPressed: () {
            if(!model.highlighting) {
              model.findItems();
            } else{
              model.clearScan();
            }
          },
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: model.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/demo_pic_4.jpg',),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Container(
                    width: model.screenWidth,
                    height: model.screenHeight,
                  ),
                ),
                for (LocatedItem item in model.items)
                  AnimatedPositioned(
                    bottom: model.highlighting?item.bottom : 0,
                    left: model.highlighting?item.left: model.screenWidth/2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: model.highlighting?1:0,
                          child: SvgPicture.asset(
                            'assets/images/scan.svg',
                            color: Colors.amber,
                          ),
                        ),
                        if(model.highlighting)
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black45
                          ),
                          child: Text(item.label,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                          ),),
                        )
                      ],
                    ),
                    duration: Duration(seconds: 1),
                  )
              ],
            ),
          ],
        ),
      );}
    );
  }
}
