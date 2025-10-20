import 'package:get/get.dart';
import 'package:travique/features/auth/bindings/auth_binding.dart';
import 'package:travique/features/auth/presentation/pages/forget_password.dart';
import 'package:travique/features/auth/presentation/pages/intro_screen.dart';
import 'package:travique/features/splash/presentation/pages/splash_screen.dart';
import 'package:travique/features/auth/presentation/pages/login_screen.dart';
import 'package:travique/features/auth/presentation/pages/register_screen.dart';
import 'package:travique/features/home/bindings/home_binding.dart';
import 'package:travique/features/home/presentation/pages/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
