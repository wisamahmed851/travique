import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository authRepository;

  ResetPasswordUsecase(this.authRepository);

  Future<Map<String, dynamic>> call(String email, String new_password){
    return this.authRepository.resetPassword(email, new_password);
  }
}