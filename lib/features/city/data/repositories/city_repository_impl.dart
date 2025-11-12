import 'package:travique/features/city/data/datasources/city_remote_data.dart';
import 'package:travique/features/city/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteData cityDataRemote;

  CityRepositoryImpl(this.cityDataRemote);

  @override
  Future<Map<String, dynamic>> cityDetail(String id){
    return cityDataRemote.cityDetail(id);
  }
}