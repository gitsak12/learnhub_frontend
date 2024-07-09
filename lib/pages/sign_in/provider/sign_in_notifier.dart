import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnhub/pages/sign_in/provider/sign_in_state.dart';

//this class is holding our state
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onUserNameChange(String email) {
    state = state.copyWith(email: email);
  }
}

//through this variable we are going to share our state in UI
final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (StateNotifierProviderRef ref) => SignInNotifier());
