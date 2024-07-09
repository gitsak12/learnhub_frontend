import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/global_loader/global_loader.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/widgets/button_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/sign_in/View/widgets/sign_in_widgets.dart';
import 'package:learnhub/pages/sign_up/Provider/register_notifier.dart';
//import 'package:learnhub/pages/sign_up/notifiers/sign_up_controller.dart';

import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../Controller/sign_up_controller.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  static const routeName = "/signUpPage";

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(globalLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(line: "Register"),
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Center(
                          child: text14Normal(
                              line: "Enter your details below & free sign up")),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      appTextField(size,
                          text: "Username",
                          imagePath: ImageRes.user,
                          hint: "Enter your username",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserNameChange(value)),
                      SizedBox(
                        height: size.height * 0.023,
                      ),
                      appTextField(size,
                          text: "Email",
                          imagePath: ImageRes.user,
                          hint: "Enter your mail",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserEmailChange(value)),
                      SizedBox(
                        height: size.height * 0.023,
                      ),
                      appTextField(size,
                          text: "Password",
                          imagePath: ImageRes.lock,
                          hint: "Enter your Password",
                          obscure: true,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserPasswordChange(value)),
                      SizedBox(
                        height: size.height * 0.023,
                      ),
                      appTextField(size,
                          text: "Confirm Password",
                          imagePath: ImageRes.lock,
                          hint: "Enter your Confirm Password",
                          obscure: true,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserRePasswordChange(value)),
                      SizedBox(
                        height: size.height * 0.023,
                      ),
                      Container(
                        //color: Colors.red,
                        //margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                        child: text14Normal(
                            line:
                                "By creating an account you have to agree with our term & condition"),
                        // child: Text(
                        //   ,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.normal,
                        //     fontSize: 14,
                        //     decoration: TextDecoration.underline,
                        //     decorationColor: AppColors.primaryText,
                        //   ),
                        // )
                      ),
                      SizedBox(height: size.height * 0.08),
                      Center(
                          child: appButton(
                              size: size,
                              buttonName: "Sign Up",
                              isLoginButton: true,
                              context: context,
                              func: _controller.handleSignUp)),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
