import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:travique/core/service/storage_service.dart';
import 'package:travique/core/theme/app_theme.dart';
import 'package:travique/features/auth/bindings/auth_binding.dart';
import 'package:travique/routes/app_pages.dart';
import 'package:travique/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  await StorageService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-project',
      theme: AppTheme.lightTheme,
      initialBinding: AuthBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}
