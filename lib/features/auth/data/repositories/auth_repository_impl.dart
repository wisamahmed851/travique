import 'package:travique/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> login(String email, String password){
    return remoteDataSource.login(email, password);
  }
}