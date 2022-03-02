import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/ui/navigationView/profileView/profile_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:qookit/services/theme/theme_service.dart';

class OrderTile extends ViewModelWidget<ProfileViewModel> {
  final int index;
  final BuildContext context;

  OrderTile(this.index, this.context);

  @override
  Widget build(BuildContext context, model) {
    return ListTile(
      title: Text('Item #$index'),
      subtitle: Text(
        'ORDERED 9.24',
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

class FlexibleProfileBar extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.heightConstraints().maxHeight.toString());
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileImage(),
              ProfileInfo(),
              SettingsIcon()
            ],
          ),
        );
        /*if(constraints.heightConstraints().maxHeight > 100){
          return Row(
            children: [
             CircleAvatar(
               child: FlutterLogo(),
               radius: 20,
             ),
              Column(
                children: [
                  Text('Big',
                  style: TextStyle(
                    color: Colors.black
                  ),),
                ],
              )
            ],
          );
        } else{
          return Row(
            children:[
              Spacer(),
              Text('Small',
                style: TextStyle(
                    color: Colors.black
                ),),
            ]
          );
        }*/
      },
    );
    /*FlexibleSpaceBar(
      title: Text(
        'Title',
        style: TextStyle(color: Colors.black),
      ),
    );*/
  }
}

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SvgPicture.asset(
        'assets/images/settings_icon.svg',
        color: Colors.black,
      ),
      onTap: (){
        //ExtendedNavigator.named('nestedNav').push(NavigationViewRoutes.settingsView) ;

        print('Click');
      },
    );
  }
}

class ProfileImage extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              //shape: BoxShape.circle,
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.blue)),

        ),
      ),
    );
  }
}

class ProfileInfo extends ViewModelBuilderWidget<ProfileViewModel> {

  ProfileInfo();

  @override
  Widget builder(BuildContext context, ProfileViewModel model, Widget child) {
    return Expanded(
      child: LayoutBuilder(
        builder:(context, constraints) =>  Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(constraints.heightConstraints().maxHeight > 70)FullName(),
              Preferences(constraints.maxWidth),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}

class FullName extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return Flexible(
      child: Text(
        hiveService.userBox.get(UserService.fullName, defaultValue: 'Karen'),
        style: headerStyle.copyWith(
          fontSize: 24
        ),
      ),
    );
  }
}

class Preferences extends ViewModelWidget<ProfileViewModel> {
  final double availWidth;

  Preferences(this.availWidth);
  @override
  Widget build(BuildContext context, viewModel) {
    return Flexible(
      child: Wrap(
        direction: Axis.horizontal,
        children: [for (String pref in viewModel.preferences) prefBlock(pref)],
      ),
    );
  }

  Widget prefBlock(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        labelPadding: EdgeInsets.all(0),

        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 20,
                maxWidth: availWidth/4,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
