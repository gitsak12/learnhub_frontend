import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/widgets/app_box_shadow.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';

import '../../../../common/utils/image_res.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.3,
      //color: Colors.red,
      child: Column(
        children: [
          settingss_name_row(size, 'Account', ImageRes.user),
          SizedBox(
            height: size.height * 0.01,
          ),
          settingss_container(size, 'Edit Account'),
          settingss_container(size, 'Change your password'),
          settingss_container(size, 'Security & privacy'),
        ],
      ),
    );
  }
}

class SettingssNotification extends StatelessWidget {
  const SettingssNotification({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.25,
      //color: Colors.red,
      child: Column(
        children: [
          settingss_name_row(size, 'Notifications', ImageRes.bell),
          SizedBox(
            height: size.height * 0.02,
          ),
          settingss_container(size, 'Notices'),
          settingss_container(size, 'App Notification'),

        ],
      ),
    );
  }
}

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.2,
      //color: Colors.red,
      child: Column(
        children: [
          settingss_name_row(size, 'More', ImageRes.more),
          SizedBox(
            height: size.height * 0.01,
          ),
          settingss_container(size, 'Language'),
          settingss_container(size, 'Country'),

        ],
      ),
    );
  }
}


Row settingss_name_row(Size size, String text, String image) {
  return Row(
    children: [
      Image.asset(
        image,
        height: size.height * 0.025,
      ),
      text24Normal(
          line: text,
          textAlign: TextAlign.center,
          fontweight: FontWeight.bold,
          fontsize: 17),
    ],
  );
}

// BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// border: Border.all(color: Colors.grey),
// boxShadow:
// ),
GestureDetector settingss_container(Size size, String text) {
  return GestureDetector(
    child: Container(
      width: size.width,
      padding: EdgeInsets.all(size.height * 0.013),
      margin: EdgeInsets.only(bottom: size.height * 0.012),
      decoration: appBoxShadow(color: Colors.white.withOpacity(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: size.height * 0.02,
            color: Colors.grey.shade600,
          )
        ],
      ),
    ),
  );
}
