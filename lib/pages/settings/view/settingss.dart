import 'package:flutter/material.dart';
import 'package:learnhub/common/routes/app_routes_names.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/pages/settings/view/widgets/settingss_widgets.dart';

import '../../../global.dart';

class Settingss extends StatelessWidget {
  const Settingss({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Confirm Logout'),
                  content: Text('Are you sure, You want to Log Out'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          Global.storageService
                              .remove(AppConstants.STORAGE_USER_PROFILE);
                          Global.storageService
                              .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutesNames.SIGN_IN, (route) => false);
                        },
                        child: Text('Confirm')),
                  ],
                );
              });
        },
        child: Container(
          margin: EdgeInsets.only(
              right: size.width * 0.03, bottom: size.height * 0.02),
          width: size.width * 0.4,
          height: size.height * 0.11,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageRes.logOut), fit: BoxFit.fitHeight)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      appBar: buildAppBar(line: 'Settings'),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Account(),
              SettingssNotification(),
              More(),
            ],
          ),
        ),
      ),
    );
  }
}
