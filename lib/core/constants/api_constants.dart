
class ApiConstants {
  static final String baseUrl = "http://192.168.100.60:3000";
  static final String imageUrl = '$baseUrl/uploads';
  static final String loginEndpoint = '$baseUrl/user/login';
  static final String logoutEndpoint = '$baseUrl/user/logout';
  static final String registerEndpoint = '$baseUrl/user/register';
  static final String emailVerificationEndpoint = '$baseUrl/user/otp/verification';
  static final String forgotPasswordEndpoint = '$baseUrl/user/forgot-password';
  static final String resetPasswordotpEndpoint = '$baseUrl/user/verify-otp';
  static final String resetPasswordEndpoint = '$baseUrl/user/reset-password';

  //public 
  static final String popularCities = '$baseUrl/city/home';
  static final String cityDetail = '$baseUrl/city/show';
}