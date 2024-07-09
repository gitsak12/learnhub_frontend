import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/app_bar.dart';
import 'package:learnhub/pages/profile/view/widgets/profile_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(line: 'Profile'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          width: size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage(size: size),
              SizedBox(height: size.height * 0.01),
              ProfileName(size:size),
              SizedBox(height: size.height * 0.04),
              ProfileListItems(size: size),
            ],
          ),
        ),
      ),
    );
  }
}


