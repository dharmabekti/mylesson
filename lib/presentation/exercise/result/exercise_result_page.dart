import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/core/app_assets.dart';
import '../../../core/app_colors.dart';
import 'exercise_result_controller.dart';

class ExerciseResultPage extends GetView<ExerciseResultController> {
  const ExerciseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.close_outlined,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Tutup',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                'Selamat',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Kamu telah menyelesaikan Kuiz ini',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                ImagesAssets.imgTrophy,
                height: 255,
              ),
              const SizedBox(height: 8),
              const Text(
                'Nilai Kamu:',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                args.toString(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
