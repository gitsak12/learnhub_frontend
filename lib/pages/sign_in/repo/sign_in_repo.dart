import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnhub/common/models/entities.dart';
import 'package:learnhub/common/services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSign(
      String email, String password) async {
    final credentials = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credentials;
  }

  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      "api/login",
      queryParameters: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
