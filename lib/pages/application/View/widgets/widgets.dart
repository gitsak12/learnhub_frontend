import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/common/widgets/image_widgets.dart';
import 'package:learnhub/pages/home/view/home.dart';
import 'package:learnhub/pages/search/view/search.dart';

import '../../../profile/view/profile.dart';

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    Home(),
    Search(),
    Center(child: Text('3', style: TextStyle(color: Colors.black),),),
    Center(child: Text('4', style: TextStyle(color: Colors.black),),),
    Profile(),


  ];
  return screens[index];
}
