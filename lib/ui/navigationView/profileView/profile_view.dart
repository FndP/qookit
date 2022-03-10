import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qookit/bloc/user_bloc.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/theme/theme_service.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view_widgets.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view_model.dart';
import 'package:qookit/ui/navigationView/settingsView/settings_view.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    print(constraints.heightConstraints().maxHeight.toString());
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (constraints.heightConstraints().maxHeight >70)
                                      Flexible(
                                        child: Text(
                                          hiveService.userBox.get(UserService.displayName, defaultValue: 'Karen'),
                                          style: headerStyle.copyWith(
                                              fontSize: 24
                                          ))),
                                    Preferences(constraints.maxWidth),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              'assets/images/settings_icon.svg',
                              color: Colors.black),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(builder: (context) => SettingsView())).then((value) {
                                setState(() {
                                  UserBloc().getUserData();
                                  print('setting click');
                                });
                              });
                              print('Click');
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                centerTitle: true,
                expandedHeight: 200,
                elevation: 8,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return OrderTile(index, context);
                  },
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
