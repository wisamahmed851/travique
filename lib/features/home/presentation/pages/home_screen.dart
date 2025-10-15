import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/features/home/presentation/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text('Welcome, ${controller.username.value}'),
      ),
    );
  }
}
