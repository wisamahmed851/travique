import 'package:travique/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travique/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> login(String email, String password){
    return remoteDataSource.login(email, password);
  }
  Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword){
    return remoteDataSource.register(name, email, password, confirmPassword);
  }
  Future<Map<String, dynamic>> otpVerification(String email, String otp, bool isPasswordReset){
    return remoteDataSource.otpVerification(email, otp, isPasswordReset);
  }
  Future<Map<String, dynamic>> forgotPassword(String email){
    return remoteDataSource.forgotPassword(email);
  }
  Future<Map<String, dynamic>> resetPassword(String email, String new_password){
    return remoteDataSource.resetPassword(email, new_password);
  }
}