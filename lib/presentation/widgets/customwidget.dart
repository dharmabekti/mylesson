// ignore_for_file: prefer_const_constructors, unnecessary_question_mark
import 'package:flutter/material.dart';
import 'package:mylesson/core/app_assets.dart';
import 'package:mylesson/core/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomWidget {
  Widget cardMapel(
      String? title, String? subtitle, String? progress, String? image) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
          leading: image == null
              ? Image.asset(ImagesAssets.imgProfile)
              : Image.network(
                  image,
                  width: 30,
                ),
          title: Text(title ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(subtitle.toString(),
                  style: TextStyle(
                    height: 2,
                    fontSize: 12,
                  )),
              SizedBox(height: 10),
              if (progress != null)
                LinearPercentIndicator(
                  percent: double.parse(progress.toString()),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                  barRadius: Radius.circular(10),
                ),
            ],
          )),
    ));
  }

  Widget pageNotFound(String? title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: [
          Image.asset(ImagesAssets.imgIllustrationNotFound),
          const SizedBox(height: 8),
          Text(
            title!,
            style: TextStyle(
              color: AppColors.grey6A,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: TextStyle(
              color: AppColors.grey6A,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Button Container
  Widget buttonContainer({required Widget child}) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.greyD6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child);
  }
}
