// ignore_for_file: prefer_const_constructors

import 'package:mylesson/presentation/exercise/list/exercise_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';
import 'package:mylesson/presentation/widgets/customwidget.dart';

import '../../../data/model/exercise_list_response.dart';
import '../../../routes/routes.dart';

class ExerciseListPageArgs {
  final String courseId;
  final String courseName;

  const ExerciseListPageArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseListController>(builder: (controller) {
      List<ExerciseListData> exercises = controller.exerciseList;
      if (exercises.isNotEmpty) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: MainAppbar(title: controller.courseName)),
          body: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.exerciseQuestionsForm,
                          arguments: exercises[index].exerciseId),
                      child: CustomWidget().cardMapel(
                          exercises[index].exerciseTitle,
                          "${exercises[index].jumlahDone ?? ''}/${exercises[index].jumlahSoal ?? ''} soal",
                          null,
                          exercises[index].icon),
                    );
                    // return ListTile(
                    //   title: Text(exercises[index].exerciseTitle ?? ''),
                    //   onTap: () {
                    //     Get.toNamed(Routes.exerciseQuestionsForm,
                    //         arguments: exercises[index].exerciseId);
                    //   },
                    // );
                  },
                ),
              )),
        );
      } else {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: MainAppbar(title: controller.courseName)),
            body: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomWidget().pageNotFound("Yah, Paket tidak tersedia",
                    "Tenang, masih banyak yang bisa kamu pelajari.\ncari lagi yuk!")));
      }
    });
  }
}
