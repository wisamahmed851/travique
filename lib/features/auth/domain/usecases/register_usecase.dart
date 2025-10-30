import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Map<String, dynamic>> call(String name, String email, String password, String confirmPassword){
    return repository.register(name, email, password, confirmPassword);
  }
}
 