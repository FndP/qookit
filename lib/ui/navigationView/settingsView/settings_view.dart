import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/services/elastic/elastic_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/theme/theme_service.dart';
import 'package:qookit/services/user/user_service.dart';
import 'package:qookit/ui/navigationView/profileView/update_profile.dart';
import 'package:qookit/ui/navigationView/settingsView/setting_view_widgets.dart';
import 'package:qookit/ui/navigationView/settingsView/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
              title: Text('SETTINGS',
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0),
          body: ListView(children: [
            SizedBox(height: 20),
            Container(
                height: MediaQuery.of(context).size.height * 0.14,
                color: Colors.white,
                child: Center(
                    child: ListTile(
                        title: Text(hiveService.userBox.get(UserService.displayName, defaultValue: 'Karen'),
                            style: headerStyle.copyWith(fontSize: 24)),
                        subtitle: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile())).then((value) {
                                setState(() {});
                              });
                            },
                            child: Text('EDIT PROFILE')),
                        leading: Container(
                          width: 55,
                          height: 60,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.blue),
                           /* image: DecorationImage(
                              image: NetworkImage(hiveService.userBox.get(UserService.profileImage, defaultValue: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')),
                              fit: BoxFit.cover,
                            ),*/
                          )
                        )))),
            SubSection(),
            SizedBox(height: 20),
            ListTile(
                tileColor: Colors.white,
                title: Text('LOGOUT', style: TextStyle(color: colorWarning)),
                leading:
                    Icon(Icons.arrow_forward_ios, color: Colors.transparent),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {

                  authService.signOut(context);
                }),
            SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
