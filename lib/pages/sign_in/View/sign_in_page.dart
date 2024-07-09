import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/global_loader/global_loader.dart';
import 'package:learnhub/common/utils/app_colors.dart';
import 'package:learnhub/common/utils/image_res.dart';
import 'package:learnhub/common/widgets/button_widgets.dart';
import 'package:learnhub/common/widgets/text_widgets.dart';
import 'package:learnhub/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:learnhub/pages/sign_in/Controller/sign_in_controller.dart';
import 'package:learnhub/pages/sign_in/View/widgets/sign_in_widgets.dart';

import '../../../common/widgets/app_bar.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final singInProvider = ref.watch(signInNotifierProvider);
    final loadingProvider = ref.watch(globalLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: loadingProvider == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thirdPartyLogin(size),
                      Center(
                          child: text14Normal(
                              line: "or use your email account to login")),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      appTextField(size,
                          controller: _controller.emailController,
                          text: "Email",
                          imagePath: ImageRes.user,
                          hint: "Enter your mail",
                          func: (value) => ref
                              .watch(signInNotifierProvider.notifier)
                              .onUserNameChange(value)),
                      SizedBox(
                        height: size.height * 0.023,
                      ),
                      appTextField(size,
                          controller: _controller.passwordController,
                          text: "Password",
                          imagePath: ImageRes.lock,
                          hint: "Enter your Password",
                          obscure: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value)),
                      SizedBox(height: size.height * 0.015),
                      GestureDetector(
                        child: Container(
                            //color: Colors.red,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08),
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryText,
                              ),
                            )),
                      ),
                      SizedBox(height: size.height * 0.14),
                      Center(
                          child: appButton(
                              size: size,
                              buttonName: "Log In",
                              isLoginButton: true,
                              context: context,
                              func: () {
                                _controller.handleSignIn(ref);
                              })),
                      SizedBox(height: size.height * 0.02),
                      Center(
                          child: appButton(
                              size: size,
                              buttonName: "Sign Up",
                              isLoginButton: false,
                              context: context,
                              func: () {
                                Navigator.pushNamed(context, "/signUpPage");
                              })),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
