import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travique/core/service/storage_service.dart';
import 'package:travique/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    final bool isLoggedIn = StorageService.isLoggedIn();
    if(!isLoggedIn){
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}