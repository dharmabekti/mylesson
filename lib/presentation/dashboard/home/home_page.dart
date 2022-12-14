// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/data/model/user_response.dart';
import 'package:mylesson/data/repository/auth_repository.dart';
import 'package:mylesson/data/services/firebase_auth_service.dart';
import 'package:mylesson/presentation/dashboard/home/home_banner_widget.dart';
import 'package:mylesson/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/dashboard/profile/profile_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(15),
          child: GetX<ProfileController>(
              init: ProfileController(
                  firebaseAuthService: Get.find<FirebaseAuthService>(),
                  authRepository: Get.find<AuthRepository>()),
              initState: (_) => Get.find<ProfileController>().getProfile(),
              builder: (controller) {
                UserData userData = controller.userData.value;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, ${userData.userName}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Selamat Datang',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: userData.userFoto == null
                            ? Image.asset(ImagesAssets.imgProfile)
                            : CircleAvatar(
                                child: ClipOval(
                                    child: Image.network(
                                        userData.userFoto.toString())),
                              )),
                  ],
                );
              }),
        ),
        Container(
          height: 130,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  width: 120,
                  child: Text(
                    "Mau kerjain latihan soal apa hari ini?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  )),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    ImagesAssets.imgSingleBanner,
                  )),
            ],
          ),
        ),
        const HomeCoursesWidget(),
        const BannerWidget(),
      ],
    );
  }
}
