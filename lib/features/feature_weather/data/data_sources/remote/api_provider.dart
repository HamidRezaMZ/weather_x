import 'package:dio/dio.dart';
import 'package:weather_x/core/params/forecast_params.dart';
import 'package:weather_x/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constants.apiKey;
  var secondApiKey = Constants.secondApiKey;


  Future<dynamic> callWeatherHeader(cityName) async {
    var response = await _dio.get(Constants.secondBaseUrl, queryParameters: {
      'key': secondApiKey,
      'q': cityName,
      'days': 14,
      'aqi': 'yes',
      'alerts': 'no',
    });
    return response;
  }
}
