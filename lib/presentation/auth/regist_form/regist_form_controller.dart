import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mylesson/data/model/register_user_request.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/routes.dart';

class RegistFormController extends GetxController {
  final AuthRepository authRepository;
  bool submitLoading = false;
  String? email;

  RegistFormController({required this.authRepository});

  Future<void> getEmail() async {
    email = FirebaseAuth.instance.currentUser?.email;
    update();
  }

  Future<void> registerUser(UserBody userBody) async {
    submitLoading = true;
    update();

    bool submitResult = await authRepository.registerUser(userBody: userBody);

    if (submitResult == true) {
      Get.offNamed(Routes.dashboard);
    }
    submitLoading = false;
    update();
  }
}
