// ignore_for_file: prefer_const_constructors
import 'package:mylesson/core/values.dart';
import 'package:mylesson/data/model/course_response.dart';
import 'package:mylesson/presentation/widgets/customwidget.dart';
import 'package:mylesson/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exercise/list/exercise_list_page.dart';
import 'home_controller.dart';

class HomeCoursesWidget extends StatefulWidget {
  const HomeCoursesWidget({Key? key}) : super(key: key);

  @override
  State<HomeCoursesWidget> createState() => _HomeCoursesWidgetState();
}

class _HomeCoursesWidgetState extends State<HomeCoursesWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: GetBuilder<HomeController>(
        builder: (controller) {
          List<CourseData> courses = controller.courseList;
          return Column(
            children: [
              if (courses.length > 3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilih Pelajaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.courseList);
                      },
                    ),
                  ],
                ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: courses.length > 3 ? 3 : courses.length,
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
                  // return ListTile(
                  //   title: Text(courses[index].courseName ?? ''),
                  //   onTap: () {
                  //     Get.toNamed(Routes.exerciseList,
                  //         arguments: ExerciseListPageArgs(
                  //           courseId: courses[index].courseId!,
                  //           courseName: courses[index].courseName ?? '',
                  //         ));
                  //   },
                  // );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
