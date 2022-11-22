import 'package:mylesson/data/repository/auth_repository.dart';
import 'package:mylesson/data/repository/banner_repository.dart';
import 'package:mylesson/data/repository/chat_repository.dart';
import 'package:mylesson/data/repository/chat_repository_impl.dart';
import 'package:mylesson/presentation/auth/login/login_controller.dart';
import 'package:mylesson/presentation/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:mylesson/presentation/dashboard/diskusi/discussion_controller.dart';
import 'package:mylesson/presentation/dashboard/profile/profile_controller.dart';

import '../../data/repository/course_repository.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import 'home/home_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<CourseRepository>(
        () => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<BannerRepository>(
        () => BannerRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<ChatRepository>(() => ChatRepositoryImpl());

    // Controller
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController(Get.find<FirebaseAuthService>(),
        Get.find<CourseRepository>(), Get.find<BannerRepository>()));
    Get.lazyPut(() => ProfileController(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        authRepository: Get.find<AuthRepository>()));
    Get.put(() => ProfileController(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        authRepository: Get.find<AuthRepository>()));
    Get.lazyPut(
        () => DiscussionController(chatRepository: Get.find<ChatRepository>()));
    Get.lazyPut(() => LoginController(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        authRepository: Get.find<AuthRepository>()));
  }
}
