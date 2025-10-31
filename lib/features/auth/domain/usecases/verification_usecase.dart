import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class VerificationUsecase {
  final AuthRepository repository;

  VerificationUsecase(this.repository);

  Future<Map<String, dynamic>> call(String email, String otp){
    return repository.otpVerification(email, otp);
  }
}