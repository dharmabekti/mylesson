// ignore_for_file: prefer_const_constructors

import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/data/model/course_response.dart';
import 'package:mylesson/presentation/course/course_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../routes/routes.dart';
import '../exercise/list/exercise_list_page.dart';

class CourseListPage extends GetView<CourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Mata Pelajaran",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GetBuilder<CourseListController>(
            builder: (courseController) {
              List<CourseData> courses = courseController.courseList;

              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  var progress =
                      courses[index].jumlahDone! / courses[index].jumlahMateri!;
                  return Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.exerciseList,
                              arguments: ExerciseListPageArgs(
                                courseId: courses[index].courseId!,
                                courseName: courses[index].courseName ?? '',
                              ));
                        },
                        leading: Image.asset(ImagesAssets.imgProfile),
                        title: Text(courses[index].courseName ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "${courses[index].jumlahDone ?? ''}/${courses[index].jumlahMateri ?? ''} Paket latihan soal",
                                style: TextStyle(
                                  height: 2,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 10),
                            LinearPercentIndicator(
                              percent: progress,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                              barRadius: Radius.circular(10),
                            ),
                          ],
                        )),
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
