import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/common/global_loader/global_loader.dart';
import 'package:learnhub/common/widgets/pop_up_messages.dart';
import 'package:learnhub/pages/sign_up/Provider/register_notifier.dart';
import 'package:learnhub/pages/sign_up/repo/sign_up_repo.dart';

class SignUpController {
  final WidgetRef ref;

  const SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.watch(registerNotifierProvider);
    String? name = state.userName;
    String? email = state.email;
    String? password = state.password;
    String? rePassword = state.rePassword;
    print("$name $email $password $rePassword");

    if (name == null ||
        email == null ||
        password == null ||
        rePassword == null) {
      toastinfo(msg: "Fill all fields");
      return;
    }

    if (password != rePassword) {
      toastinfo(msg: "Your password did not match");
      return;
    }

    ref.read(globalLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    Future.delayed(
      Duration(seconds: 2),
      () async {
        try {
          print("try");
          final credential = await SignUpRepo.firebaseSignUp(email, password);
          if (credential.user != null) {
            print('not null');
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(name);
            String photoUrl = "student.png";
            await credential.user?.updatePhotoURL(photoUrl);
            //get photo url
            //set user photo

            toastinfo(
                msg:
                    "An Email has been sent to verify your account. Please open mail to verify ");
            context.pop();
          }
        } catch (e) {
          print(e.toString());
        }
        ref.read(globalLoaderProvider.notifier).setLoaderValue(false);
      },
    );
  }
}
