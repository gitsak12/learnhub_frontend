import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/global_loader/global_loader.dart';
import 'package:learnhub/common/services/http_util.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/common/widgets/pop_up_messages.dart';
import 'package:learnhub/main.dart';
import 'package:learnhub/pages/application/View/application.dart';
import 'package:learnhub/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:learnhub/pages/sign_in/repo/sign_in_repo.dart';

import '../../../common/models/user.dart';
import '../../../global.dart';

class SignInController {
  //WidgetRef ref;

  //SignInController({required this.ref});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String? name = state.email;
    String? password = state.password;
    //print("$name  $password");

    if (name == null && password == null) {
      toastinfo(msg: "Fill your credentials");
      return;
    }
    if (name == null) {
      toastinfo(msg: "Enter your Name");
      return;
    }

    if (password == null) {
      toastinfo(msg: "Enter your password");
      return;
    }
    emailController.text = name;
    passwordController.text = password;
    ref.read(globalLoaderProvider.notifier).setLoaderValue(true);
    try {
      print(1);
      final credential = await SignInRepo.firebaseSign(name, password);
      if (credential.user == null) {
        toastinfo(msg: "User not found");
        return;
      }

      if (!credential.user!.emailVerified) {
        toastinfo(msg: "First Verify your email, Do a Sign up");
        return;
      }
      var user = credential.user;
      if (user != null) {
        print(3);
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.name = user.displayName;
        loginRequestEntity.open_id = user.uid;
        loginRequestEntity.avatar = user.photoURL;
        loginRequestEntity.email = user.email;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
      } else {
        print(34);
        toastinfo(msg: "Login Error");
      }
      ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
    } on FirebaseAuthException catch (e) {
      print(5);
      ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
      if (e.code == "user not found") {
        toastinfo(msg: "User not Found");
      }
      if (e.code == "wrong-password") {
        print(4);
        toastinfo(msg: "Wrong password provided");
      }
    } catch (e) {
      toastinfo(msg: "Some error occured. Please try again");
      print(e.toString());
      ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    //here we have to talk to server
    var result = await SignInRepo.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        print('try post');
        // and also store value to local
        //var navigator = Navigator.of(ref.context);
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE, jsonEncode(result.data));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token);

        //redirect to page
        navkey.currentState
            ?.pushNamedAndRemoveUntil(Application.routeName, (route) => false);
      } catch (e) {
        print("error catch in postlogindata method");
        print(e.toString());
      }
    } else {
      print("login error");
    }
  }
}
