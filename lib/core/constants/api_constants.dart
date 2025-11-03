
class ApiConstants {
  static final String baseUrl = "http://192.168.100.191:3000";
  static final String loginEndpoint = '$baseUrl/user/login';
  static final String registerEndpoint = '$baseUrl/user/register';
  static final String emailVerificationEndpoint = '$baseUrl/user/otp/verification';
  static final String forgotPasswordEndpoint = '$baseUrl/user/forgot-password';
  static final String resetPasswordotpEndpoint = '$baseUrl/user/verify-otp';
  static final String resetPasswordEndpoint = '$baseUrl/user/reset-password';
}