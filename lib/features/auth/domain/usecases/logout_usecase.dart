import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<Map<String, dynamic>> call(String token){
    return authRepository.logout(token);
  }
}