import 'package:travique/features/home/data/datasources/home_remote_data_source.dart';
import 'package:travique/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Map<String, dynamic>> getHomeData(){
    return homeRemoteDataSource.getHomeData();
  }
}