import 'package:get/get.dart';
import 'package:travique/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:travique/features/auth/presentation/pages/intro_screen.dart';
import 'package:travique/features/auth/presentation/pages/new_password.dart';
import 'package:travique/features/auth/presentation/pages/otp_verifcation.dart';
import 'package:travique/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:travique/features/city/bindings/city_binding.dart';
import 'package:travique/features/city/presentation/pages/city_details_screen.dart';
import 'package:travique/features/city/presentation/pages/city_selection_screen.dart';
import 'package:travique/features/favorite_places/bindings/favorite_places_binding.dart';
import 'package:travique/features/favorite_places/presentation/pages/favorite_places_screen.dart';
import 'package:travique/features/layout/presentation/pages/main_layout.dart';
import 'package:travique/features/place/bindings/place_binding.dart';
import 'package:travique/features/place/presentation/pages/place_detail_screen.dart';
import 'package:travique/features/profile/bindings/profile_binding.dart';
import 'package:travique/features/profile/presentation/pages/profile_edit.screen.dart';
import 'package:travique/features/profile/presentation/pages/profile_view_screen.dart';
import 'package:travique/features/splash/presentation/pages/splash_screen.dart';
import 'package:travique/features/auth/presentation/pages/login_screen.dart';
import 'package:travique/features/auth/presentation/pages/register_screen.dart';
import 'package:travique/features/home/bindings/home_binding.dart';
import 'package:travique/features/home/presentation/pages/home_screen.dart';
import 'package:travique/features/home/presentation/pages/home2_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final bool isPasswordReset = args?['isPasswordReset'] ?? false;
        final String email = args?['email'] ?? '';
        return OtpVerificationScreen(isPasswordReset: isPasswordReset, email: email,);
      },
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.NEW_PASSWORD,
      page: () => NewPassword(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final String email = args?['email'] ?? '';
        return ResetPasswordScreen(email: email);
      },

    ),
    GetPage(
      name: Routes.CITY_SELECTION,
      page: () => CitySelectionScreen(),
      binding: CityBinding(),
    ),
    GetPage(
      name: Routes.CITY_DETAIL,
      page: () => CityDetailsScreen(),
      binding: CityBinding(),
    ),
    GetPage(
      name: Routes.MAIN_LAYOUT,
      page: () => const MainLayout(),
      bindings: [
        HomeBinding(),
        FavoritePlacesBinding(),
        ProfileBinding(),
      ],
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME2,
      page: () => Home2Screen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PLACE_DETAILS,
      page: () => PlaceDetailScreen(),
      binding: PlaceBinding(),
    ),
    GetPage(
      name: Routes.FAVORITE_PLACES,
      page: () => FavoritePlacesScreen(),
      binding: FavoritePlacesBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_VIEW,
      page: () => ProfileViewScreen(),
      // binding: FavoritePlacesBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_EDIT,
      page: () => ProfileEditScreen(),
      // binding: FavoritePlacesBinding(),
    ),
  ];
}
