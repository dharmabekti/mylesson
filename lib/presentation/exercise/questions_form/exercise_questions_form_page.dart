// ignore_for_file: unused_local_variable, prefer_const_constructors, sort_child_properties_last

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mylesson/core/app_colors.dart';
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
                                      onPressed: () => controller
                                          .navigateToQuestionIndex(index),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight:
                                              index == activeQuestionIndex
                                                  ? FontWeight.w800
                                                  : FontWeight.w400,
                                          color: index == activeQuestionIndex
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(
                                              side: BorderSide(
                                            width: 1.0,
                                            color: AppColors.primary,
                                          )),
                                          padding: EdgeInsets.all(1),
                                          backgroundColor: AppColors.white),
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
                          HtmlWidget(activeQuestion.questionTitle ?? ''),
                          SizedBox(
                            height: 10,
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: HtmlWidget(activeQuestion.optionA ?? ''),
                              value: 'A',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: 'A');
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: HtmlWidget(activeQuestion.optionB ?? ''),
                              value: 'B',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: 'B');
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: HtmlWidget(activeQuestion.optionC ?? ''),
                              value: 'C',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: 'C');
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: HtmlWidget(activeQuestion.optionD ?? ''),
                              value: 'D',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: 'D');
                              },
                            ),
                          ),
                          CustomWidget().buttonContainer(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0.0),
                              title: HtmlWidget(activeQuestion.optionE ?? ''),
                              value: 'E',
                              groupValue: selectedAnswer,
                              onChanged: (val) {
                                controller.updateAnswerToQuestion(
                                    questionId: activeQuestionId ?? '',
                                    answer: 'E');
                              },
                            ),
                          ),
                        ],
                      ),
                      if (activeQuestionIndex < 10)
                        ElevatedButton(
                          onPressed: () {
                            controller.navigateToQuestionIndex(
                                activeQuestionIndex + 1);
                          },
                          child: const Text('Selanjutnya'),
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            controller.submitAnswers();
                          },
                          child: const Text('Kumpulin'),
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
