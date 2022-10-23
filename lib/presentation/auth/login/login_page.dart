import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/presentation/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../widgets/signin_google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Wrap(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 36),
              SvgPicture.asset(
                ImagesAssets.imageIllustrationLoginSvg,
                height: 255,
              ),
              const SizedBox(height: 60),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                style: TextStyle(
                  color: AppColors.grey6A,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              SocialLoginButton(
                text: 'Masuk dengan Google',
                iconAsset: ImagesAssets.iconGooglePng,
                outlineBorderColor: AppColors.mint,
                onPressed: () async {
                  await Get.find<LoginController>().onGoogleSignIn();
                },
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                text: 'Masuk dengan Apple ID',
                iconAsset: ImagesAssets.iconApplePng,
                backgroundColor: AppColors.black,
                textColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
