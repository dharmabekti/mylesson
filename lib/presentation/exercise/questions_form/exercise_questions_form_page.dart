// ignore_for_file: unused_local_variable, prefer_const_constructors, sort_child_properties_last
import 'package:html/parser.dart' show parse;
import 'package:mylesson/core/app_colors.dart';
import 'package:mylesson/core/custom_function.dart';
import 'package:mylesson/data/model/question_list_response.dart';
import 'package:mylesson/presentation/exercise/questions_form/exercise_questions_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/widgets/appbarWidget.dart';
import 'package:mylesson/presentation/widgets/customwidget.dart';

class ExerciseQuestionsFormPage extends StatelessWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseQuestionsFormController>(
      builder: (controller) {
        List<QuestionListData> questions = controller.questionList;
        int activeQuestionIndex = controller.activeQuestionIndex;
        QuestionListData activeQuestion = QuestionListData();
        String? activeQuestionId, selectedAnswer;
        if (questions.isNotEmpty) {
          activeQuestion = questions[activeQuestionIndex];
          activeQuestionId = controller.activeQuestionId;
          selectedAnswer = controller.selectedAnswer;
        }

        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: MainAppbar(title: "Latihan Soal")),
          body: questions.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: questions.length,
                            itemBuilder: (context, index) => SizedBox(
                                  height: 30, //height of button
                                  width: 30, //width of button
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // controller
                                        //     .navigateToQuestionIndex(index);
                                      },
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight:
                                              index == activeQuestionIndex
                                                  ? FontWeight.w800
                                                  : FontWeight.w400,
                                          color: index == activeQuestionIndex
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(
                                            side: BorderSide(
                                          width: 1.0,
                                          color: AppColors.primary,
                                        )),
                                        padding: EdgeInsets.all(1),
                                        backgroundColor:
                                            index <= activeQuestionIndex
                                                ? AppColors.primary
                                                : AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                            // IconButton(
                            //   icon: Text(
                            //     '${index + 1}',
                            //     style: TextStyle(
                            //       fontWeight: index == activeQuestionIndex
                            //           ? FontWeight.w800
                            //           : FontWeight.w400,
                            //       color: index == activeQuestionIndex
                            //           ? Colors.blue
                            //           : Colors.black,
                            //     ),
                            //   ),
                            //   color: Colors.amber,
                            //   onPressed: () {
                            //     controller.navigateToQuestionIndex(index);
                            //   },
                            // ),
                            ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Soal Nomor ${(activeQuestionIndex + 1).toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, height: 3),
                          ),
                          Text(CustomFunction.removeTag(
                              htmlString: activeQuestion.questionTitle ?? '')),
                          SizedBox(
                            height: 10,
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: Text(CustomFunction.removeTag(
                                  htmlString: activeQuestion.optionA ?? '')),
                              value: 'A',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: val.toString());
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: Text(CustomFunction.removeTag(
                                  htmlString: activeQuestion.optionB ?? '')),
                              value: 'B',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: val.toString());
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: Text(CustomFunction.removeTag(
                                  htmlString: activeQuestion.optionC ?? '')),
                              value: 'C',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: val.toString());
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: Text(CustomFunction.removeTag(
                                  htmlString: activeQuestion.optionD ?? '')),
                              value: 'D',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: val.toString());
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: Text(CustomFunction.removeTag(
                                  htmlString: activeQuestion.optionE ?? '')),
                              value: 'E',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: val.toString());
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.navigateToQuestionIndex(
                                  activeQuestionIndex - 1);
                            },
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(Icons.navigate_before),
                                Text('Sebelumnya'),
                              ],
                            ),
                          ),
                          activeQuestionIndex < (questions.length - 1)
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.navigateToQuestionIndex(
                                        activeQuestionIndex + 1);
                                  },
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text('Selanjutnya'),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                              : ElevatedButton(
                                  onPressed: () {
                                    controller.submitAnswers();
                                  },
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(Icons.check),
                                      Text('Kumpulkan'),
                                    ],
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
