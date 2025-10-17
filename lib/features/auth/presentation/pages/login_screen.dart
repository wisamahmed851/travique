import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(
      context,
    ).size; // Get screen size for responsiveness

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/images/login_bg.png', fit: BoxFit.cover),
          // Image.asset('assets/images/login_bg_front.png', fit: BoxFit.cover),

          // White gradient overlay
          Positioned(
            top: 0,
            bottom: size.height * 0.25,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(100, 255, 255, 255).withOpacity(0.0),
                    const Color.fromARGB(250, 255, 255, 255).withOpacity(0.0),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.9),
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
          // Foreground content (Login form at bottom)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.35,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                // borderRadius: const BorderRadius.only(
                //   topLeft: Radius.circular(16),
                //   topRight: Radius.circular(16),
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 8,
                //     offset: const Offset(0, -2),
                //   ),
                // ],
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Space between top and bottom
                    children: [
                      // Top back button + title
                  
                      // // Bottom login form
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.all(16),
                      //   // margin: EdgeInsets.only(bottom: size.height * 0.05), // 5% bottom space
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(0.85),
                      //     borderRadius: BorderRadius.circular(12),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black12,
                      //         blurRadius: 8,
                      //         offset: const Offset(0, 2),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min, // Wrap only its content
                      //     children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        controller: controller.emailController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        controller: controller.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: controller.login,
                          child: const Text('Submit'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password ?'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black54),
                  ),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
