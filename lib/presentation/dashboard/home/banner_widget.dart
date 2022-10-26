// ignore_for_file: prefer_const_constructors

import 'package:mylesson/core/values.dart';
import 'package:mylesson/data/model/banner_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: GetBuilder<HomeController>(
        builder: (controller) {
          List<BannerData> banners = controller.bannerList;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terbaru',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          Image.network(banners[index].eventImage.toString()));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
