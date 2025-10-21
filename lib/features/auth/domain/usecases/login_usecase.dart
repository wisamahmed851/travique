import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Map<String, dynamic>> call(String email, String password){
    return repository.login(email, password);
  }
}