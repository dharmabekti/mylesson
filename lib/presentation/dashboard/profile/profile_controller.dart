import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mylesson/data/model/user_response.dart';
import 'package:mylesson/data/repository/auth_repository.dart';
import 'package:mylesson/data/services/firebase_auth_service.dart';

class ProfileController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  ProfileController(
      {required this.firebaseAuthService, required this.authRepository});

  var userData = UserData().obs;
  Future<void> getProfile() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      UserData? result = await authRepository.getUserByEmail(email: email);
      userData.update((_) {
        userData.value = result!;
      });
    }
  }
}
