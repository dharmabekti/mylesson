// ignore_for_file: prefer_const_constructors

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/data/model/user_response.dart';
import 'package:mylesson/presentation/auth/login/login_controller.dart';
import 'package:mylesson/presentation/dashboard/profile/profile_controller.dart';
import 'package:mylesson/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0), child: buildAppBar(context)),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      elevation: 0,
      title: const Text('Akun Saya'),
      backgroundColor: const Color(0xff3A7FD5),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () => redirectToEditPage(),
          child: const Text(
            'Edit',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
      ],
      bottom: buildBottomAppBar(context),
    );
  }

  void redirectToEditPage() {
    Get.toNamed(Routes.editProfile);
  }

  PreferredSizeWidget buildBottomAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: GetX<ProfileController>(
              initState: (_) => Get.find<ProfileController>().getProfile(),
              builder: (controller) {
                UserData userData = controller.userData.value;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData.userName.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              userData.userAsalSekolah.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: ExtendedImage.network(
                        userData.userFoto.toString(),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        cache: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                );
              }),
        ));
  }

  Widget buildBody(BuildContext context) {
    return GetX<ProfileController>(
      initState: (_) => Get.find<ProfileController>().getProfile(),
      builder: (controller) {
        UserData userData = controller.userData.value;
        return ListView(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'Identitas Diri',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  buildContentProfile(
                    context: context,
                    title: 'Nama Lengkap',
                    value: userData.userName.toString(),
                  ),
                  buildContentProfile(
                    context: context,
                    title: 'Email',
                    value: userData.userEmail.toString(),
                  ),
                  buildContentProfile(
                    context: context,
                    title: 'Jenis Kelamin',
                    value: userData.userGender.toString(),
                  ),
                  buildContentProfile(
                    context: context,
                    title: 'Kelas',
                    value: userData.kelas.toString(),
                  ),
                  buildContentProfile(
                    context: context,
                    title: 'Sekolah',
                    value: userData.userAsalSekolah.toString(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            buildLogoutSection(
              context: context,
              onTap: () => onLogoutPressed(),
            ),
          ],
        );
      },
    );
  }

  Widget buildContentProfile({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogoutSection({
    required BuildContext context,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(
                Icons.exit_to_app,
                color: Color(0xffEB5757),
              ),
              SizedBox(width: 6),
              Text(
                'Keluar',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffEB5757),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogoutPressed() => Get.find<LoginController>().signOut();
}
