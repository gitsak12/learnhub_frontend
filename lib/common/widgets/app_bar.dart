import 'package:flutter/material.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

/*
prefererd size widget gives you a height from the
 appBar downwards and we can put child in the given space
 */
AppBar buildAppBar({String line = "Login"}) {
  return AppBar(
    forceMaterialTransparency: true,
    bottomOpacity: 0,
    bottom: PreferredSize(
      child: Container(
        height: 1,
        color: Colors.grey.withOpacity(0.3),
      ),
      preferredSize: Size.fromHeight(1),
    ),
    title: Text16Normal(line: line, color: AppColors.primaryText),
  );
}
