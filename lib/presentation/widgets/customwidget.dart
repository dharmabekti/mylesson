// ignore_for_file: prefer_const_constructors, unnecessary_question_mark
import 'package:flutter/material.dart';
import 'package:mylesson/core/app_assets.dart';
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
}
