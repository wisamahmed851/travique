import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class OtpVerificationScreen extends StatefulWidget {
  final bool isPasswordReset;
  final String email; 

  const OtpVerificationScreen({
    Key? key,
    required this.isPasswordReset,
    required this.email,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final AuthController controller = Get.find();
  final int otpLength = 6;
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // void _onOtpChanged(String value, int index) {
  //   if (value.isNotEmpty && index < otpLength - 1) {
  //     FocusScope.of(context).requestFocus(focusNodes[index + 1]);
  //   } else if (value.isEmpty && index > 0) {
  //     FocusScope.of(context).requestFocus(focusNodes[index - 1]);
  //   }
  // }

  void _submitOtp() async {
    if (_isVerifying) return;

    String otp = otpControllers.map((e) => e.text).join();
    if (otp.length < otpLength) {
      Get.snackbar("Error", "Please enter the complete OTP");
      return;
    }
    _isVerifying = true;
    controller.verificationemailController.text = widget.email;

    try {
      if (widget.isPasswordReset) {
        await controller.otpVerification(otp);
      } else {
        await controller.otpVerification(otp);
      }
    } finally {
      _isVerifying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.85, 1.1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28 * scale,
            vertical: 20 * scale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Back Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.textDark,
                  size: 26 * scale,
                ),
              ),
              SizedBox(height: 45 * scale),

              // 🏷️ Title
              Center(
                child: Text(
                  widget.isPasswordReset
                      ? 'Reset Password'
                      : 'Email Verification',
                  style: AppTextStyles.heading.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 26 * scale,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 22 * scale),

              // 📜 Subtitle
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * scale),
                  child: Text(
                    widget.isPasswordReset
                        ? 'Enter the code sent to your email to reset your password.'
                        : 'Enter the code we sent to verify your email address.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 18 * scale,
                      color: AppColors.textDarkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35 * scale),

              // 🔢 OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(otpLength, (index) {
                  return SizedBox(
                    width: 48 * scale,
                    height: 56 * scale,
                    child: Focus(
                      onKeyEvent: (node, event) {
                        if (event.logicalKey.keyLabel == 'Backspace' &&
                            otpControllers[index].text.isEmpty &&
                            index > 0) {
                          // Move focus back
                          focusNodes[index - 1].requestFocus();
                          otpControllers[index - 1].selection =
                              TextSelection.fromPosition(
                                TextPosition(
                                  offset: otpControllers[index - 1].text.length,
                                ),
                              );
                        }
                        return KeyEventResult.ignored;
                      },
                      child: TextField(
                        controller: otpControllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical
                            .center, // ✅ Keeps text perfectly centered
                        maxLength: 1,
                        style: AppTextStyles.heading.copyWith(
                          fontSize: 22 * scale,
                          height: 1.2,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding:
                              EdgeInsets.zero, // ✅ Centers vertically
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < otpLength - 1) {
                            // Move to next
                            focusNodes[index + 1].requestFocus();
                          }

                          // ✅ If last field is filled, trigger auto-submit
                          if (value.isNotEmpty && index == otpLength - 1) {
                            bool allFilled = otpControllers.every(
                              (c) => c.text.isNotEmpty,
                            );
                            if (allFilled) {
                              _submitOtp(); // 👈 call your function here
                            }
                          }

                          // Handle backspace navigation manually if needed
                          if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 40 * scale),

              // ✅ Verify Button
              SizedBox(
                width: double.infinity,
                height: 52 * scale,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _submitOtp,
                  child: Text(
                    'Verify',
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                      fontSize: 18 * scale,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
