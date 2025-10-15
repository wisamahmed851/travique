import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/routes/app_pages.dart';
import 'package:travique/routes/app_routes.dart';

void main(){
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-project',
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
