import 'package:mylesson/data/model/banner_response.dart';
import 'package:mylesson/data/repository/banner_repository.dart';
import 'package:mylesson/data/repository/course_repository.dart';
import 'package:mylesson/data/services/firebase_auth_service.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';

class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final CourseRepository courseRepository;
  final BannerRepository bannerRepository;

  HomeController(
      this.firebaseAuthService, this.courseRepository, this.bannerRepository);

  List<CourseData> courseList = [];
  List<BannerData> bannerList = [];

  // Currently set to static
  String majorName = 'IPA';

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result =
          await courseRepository.getCourses(majorName: majorName, email: email);
      courseList = result;
      update();
    }
  }

  Future<void> getBanner() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<BannerData> result = await bannerRepository.getBanners(limit: 5);
      bannerList = result;
      update();
    }
  }
}
