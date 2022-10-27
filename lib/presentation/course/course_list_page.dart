// ignore_for_file: prefer_const_constructors

import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/data/model/course_response.dart';
import 'package:mylesson/presentation/course/course_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';
import 'package:mylesson/presentation/widgets/customwidget.dart';
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
          child: MainAppbar(title: "Mata Pelajaran")),
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
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.exerciseList,
                        arguments: ExerciseListPageArgs(
                          courseId: courses[index].courseId!,
                          courseName: courses[index].courseName ?? '',
                        )),
                    child: CustomWidget().cardMapel(
                        courses[index].courseName,
                        "${courses[index].jumlahDone ?? ''}/${courses[index].jumlahMateri ?? ''} Paket latihan soal",
                        progress.toString(),
                        null),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
