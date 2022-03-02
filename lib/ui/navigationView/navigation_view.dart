import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/app/app_router.gr.dart';
import 'package:qookit/ui/navigationView/drawer/drawer_view.dart';
import 'package:qookit/ui/navigationView/navigation_view_model.dart';
import 'package:stacked/stacked.dart';

class NavigationView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationViewModel>.reactive(
        viewModelBuilder: () => NavigationViewModel(),
        onModelReady: (model) => model.initializeModel(),
        builder: (context, model, child) {

          NavigationObserver observer = NavigationObserver(model);

          return WillPopScope(
            onWillPop: () => model.onWillPop(context),
            child: Scaffold(
              extendBody: true,
              drawer: NavDrawer(),
              body: ExtendedNavigator(
                router: NavigationViewRouter(),
                initialRoute: model.screenId,
                name: 'nestedNav',
                observers: [observer],
              ),
              floatingActionButton: model.hideNav ? null : FloatingActionButton(
                key: model.fabKey,
                backgroundColor: Colors.amber,
                onPressed: () {
                  if(!model.showOverlay) {
                    model.updateOverlay(true);
                    Overlay.of(context).insert(model.firstFabOverlay);
                  } else{
                    model.updateOverlay(false);
                    model.fabOverlay.remove();
                  }
                },
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/crop_icon.svg',
                        color: Colors.black
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/add_icon.svg',
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: model.hideNav ? null:BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomIcon(model.navItems[0],0,model),
                    BottomIcon(model.navItems[1],1,model),

                    SizedBox(height: 40, width: 48),

                    BottomIcon(model.navItems[2],2,model),
                    BottomIcon(model.navItems[3],3,model),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget BottomIcon(BottomItem item,int index,NavigationViewModel model) {
    return Flexible(
      child: FlatButton(
        //shape: RoundedRectangleBorder( borderRadius:BorderRadius.circular(8)),
        clipBehavior: Clip.none,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: ()=> model.onItemTapped(index),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 50,
          width: 48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
              item.assetIcon,
                color: model.selectedIndex == index ? Colors.amber : Colors.black,
          ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(item.label,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: model.selectedIndex == index ? Colors.amber : Colors.black,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
