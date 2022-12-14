import "package:get/get_navigation/src/routes/get_route.dart";
import 'package:mylesson/presentation/dashboard/profile/edit_profile_page.dart';

import '../presentation/auth/regist_form/regist_form_binding.dart';
import '../presentation/auth/regist_form/regist_form_page.dart';
import '../presentation/dashboard/dashboard_binding.dart';
import '../presentation/dashboard/dashboard_page.dart';
import '../presentation/splash/splash_binding.dart';
import '../presentation/splash/splash_page.dart';
import '../presentation/auth/login/login_binding.dart';
import '../presentation/auth/login/login_page.dart';
import '../presentation/course/course_list_binding.dart';
import '../presentation/course/course_list_page.dart';
import '../presentation/exercise/list/exercise_list_binding.dart';
import '../presentation/exercise/list/exercise_list_page.dart';
import '../presentation/exercise/questions_form/exercise_questions_form_binding.dart';
import '../presentation/exercise/questions_form/exercise_questions_form_page.dart';
import '../presentation/exercise/result/exercise_result_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.registerForm,
        page: () => RegistFormPage(),
        binding: RegistFormBinding()),
    GetPage(
        name: Routes.courseList,
        page: () => const CourseListPage(),
        binding: CourseListBinding()),
    GetPage(
      name: Routes.exerciseList,
      page: () => const ExerciseListPage(),
      binding: ExerciseListBinding(),
      arguments: ExerciseListPageArgs,
    ),
    GetPage(
      name: Routes.exerciseQuestionsForm,
      page: () => const ExerciseQuestionsFormPage(),
      binding: ExerciseQuestionsFormBinding(),
      arguments: String,
    ),
    GetPage(
      name: Routes.exerciseResult,
      page: () => const ExerciseResultPage(),
      arguments: String,
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilePage(),
      binding: DashboardBinding(),
      arguments: String,
    ),
  ];
}
