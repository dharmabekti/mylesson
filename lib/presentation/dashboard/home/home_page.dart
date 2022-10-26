// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/data/model/course_response.dart';
import 'package:mylesson/data/model/user_response.dart';
import 'package:mylesson/presentation/auth/login/login_controller.dart';
import 'package:mylesson/presentation/course/course_list_controller.dart';
import 'package:mylesson/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../routes/routes.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<LoginController>(
                initState: (_) {
                  Get.find<LoginController>().getUser();
                },
                builder: (controller) {
                  UserData userData = controller.userData;
                  return Column(
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
                  );
                },
              ),
              Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Image.asset(ImagesAssets.imgProfile)),
            ],
          ),
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
        // Container(
        //   margin: EdgeInsets.all(15),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Pilih Pelajaran',
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () => Get.toNamed(Routes.courseList),
        //             child: Text(
        //               'Lihat Semua',
        //               style: TextStyle(
        //                 fontSize: 10,
        //                 color: AppColors.primary,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       Card(
        //           child: Container(
        //         padding: EdgeInsets.all(10),
        //         child: ListTile(
        //             leading: Image.asset(ImagesAssets.imgProfile),
        //             title: Text("Mapel",
        //                 style: TextStyle(
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                 )),
        //             subtitle: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Text("0/50 Paket latihan soal",
        //                     style: TextStyle(
        //                       height: 2,
        //                       fontSize: 12,
        //                     )),
        //                 SizedBox(height: 10),
        //                 LinearPercentIndicator(
        //                   percent: 0.1,
        //                   backgroundColor: Colors.grey,
        //                   progressColor: Colors.blue,
        //                   barRadius: Radius.circular(10),
        //                 ),
        //               ],
        //             )),
        //       )),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
