import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import '../../../data/model/user_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  LoginController(
      {required this.firebaseAuthService, required this.authRepository});

  /// Steps:
  /// 1. Sign In With Google
  /// 2. Get Email from UserCredential
  /// 3. Check isUserRegistered()
  Future<void> onGoogleSignIn() async {
    User? user = await firebaseAuthService.signInWithGoogle();
    if (user != null) {
      await isUserRegistered();
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }

  Future<void> isUserRegistered() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      UserData? userData = await authRepository.getUserByEmail(email: email);
      if (userData != null) {
        print(userData.iduser);
        if (userData.iduser.toString() != "0") {
          var sessionManager = SessionManager();
          await sessionManager.set("userData", userData);
          // User is Registered
          Get.offAllNamed(Routes.dashboard);
        } else {
          // User is Signed In & Is not Registered
          Get.offAllNamed(Routes.registerForm);
        }
      } else {
        // User is Signed In & Is not Registered
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  UserData userData = UserData();
  Future<void> getUser() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      UserData? result = await authRepository.getUserByEmail(email: email);
      userData = result!;
      var sessionManager = SessionManager();
      await sessionManager.set("userData", userData);
      await sessionManager.set("jenjang", userData.jenjang);
      update();
    }
  }
}
