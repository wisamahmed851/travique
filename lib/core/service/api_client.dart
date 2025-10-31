import 'package:get/get_connect/connect.dart';
import 'package:travique/core/constants/api_constants.dart';

class ApiClient extends GetConnect {
  @override
  void onInit(){
    httpClient.baseUrl = ApiConstants.baseUrl;

    httpClient.defaultContentType = 'application/json';
    httpClient.addRequestModifier<dynamic>((request){
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    httpClient.timeout = const Duration(seconds: 10);

    super.onInit();
  }
}