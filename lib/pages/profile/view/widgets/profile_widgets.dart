import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/models/entities.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/profile/controller/profile_controller.dart';

import '../../../../common/utils/image_res.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        UserProfile profileState = ref.read(profileControllerProvider);

        return Container(
          alignment: Alignment.bottomRight,
          width: size.width * 0.26,
          height: size.height * 0.1,
          decoration: profileState.avatar == null
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(ImageRes.headpic),
                  ))
              : BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                        '${AppConstants.IMAGE_UPLOAD_PATH}${profileState.avatar}'),
                  )),
          child: Image.asset(
            ImageRes.edit_image,
            height: size.height * 0.033,
            width: size.width * 0.1,
          ),
        );
      },
    );
  }
}

// Image.asset(
// ImageRes.edit_image,
// height: size.height * 0.032,
// width: size.width * 0.1,
// ),
class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        UserProfile profileState = ref.read(profileControllerProvider);

        return Column(
          children: [
            Container(
              //margin: EdgeInsets.only(right: size.width * 0.1),
              alignment: Alignment.topCenter,
              width: size.width * 0.5,
              height: size.height * 0.04,
              //color: Colors.red,
              child: text24Normal(
                  line: profileState.name!,
                  fontweight: FontWeight.bold,
                  fontsize: 20),
            ),
            text24Normal(
                line: profileState.description != null
                    ? '${profileState.description}'
                    : 'I have been working as a flutter dev about 2 years. I think with the upcoming updates , Flutter is going to become better and better',
                fontsize: 11,
                color: Colors.grey.shade600),
          ],
        );
      },
    );
  }
}

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        UserProfile profileState = ref.read(profileControllerProvider);

        return Column(
          children: [
            ListItem(
              size: size,
              image: ImageRes.settings,
              text: 'Settings',
              func: () => Navigator.of(context).pushNamed('/settingss'),
            ),
            ListItem(
              size: size,
              image: ImageRes.love,
              text: 'Likes',
            ),
            ListItem(size: size, image: ImageRes.reminder, text: 'Reminder'),
          ],
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? func;

  const ListItem({
    super.key,
    required this.size,
    required this.image,
    required this.text,
    this.func,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: size.width * 1,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: size.width * 0.1,
              margin: EdgeInsets.only(
                  right: size.width * 0.05, bottom: size.height * 0.01),
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                image,
                width: size.width * 0.05,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              // width: size.width * 0.6,

              child: text24Normal(
                  textAlign: TextAlign.center,
                  line: text,
                  fontsize: 13,
                  fontweight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
