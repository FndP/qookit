import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qookit/app/theme/colors.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/theme/theme_service.dart';
import 'package:qookit/ui/navigationView/settingsView/setting_view_widgets.dart';
import 'package:qookit/ui/navigationView/settingsView/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
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
                        title: Text('Karen Smith',
                            style: headerStyle.copyWith(fontSize: 24)),
                        subtitle: Text('EDIT PROFILE'),
                        leading:
                            Icon(Icons.account_circle_rounded, size: 60)))),
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
