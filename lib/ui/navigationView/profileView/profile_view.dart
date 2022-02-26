import 'package:flutter/material.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view_widgets.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      /*Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Log Out'),
              onPressed: () {
                authService.signOut(
                    navigationService.outerNavKey.currentContext);
              },
            ),
            RaisedButton(
              child: Text('Print Token'),
              onPressed: () async {
                print(await authService.token);
              },
            ),
          ],
        ),
      ),
    );*/

    SafeArea(
      child: ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, model, child) => Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleProfileBar(),
                centerTitle: true,
                expandedHeight: 200,
                //collapsedHeight: 70,
                elevation: 8,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return OrderTile(index, context);
                  },
                  // Builds 1000 ListTiles
                  childCount: 1000,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
