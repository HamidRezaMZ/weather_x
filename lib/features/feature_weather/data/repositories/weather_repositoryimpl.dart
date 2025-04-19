import 'package:dio/dio.dart';
import 'package:weather_x/core/params/forecast_params.dart';
import 'package:weather_x/core/resources/data_state.dart';
import 'package:weather_x/features/feature_weather/data/data_sources/remote/api_provider.dart';

import 'package:weather_x/features/feature_weather/data/models/forecast_weather_model.dart';

import 'package:weather_x/features/feature_weather/domain/entities/forecast_entity.dart';
import 'package:weather_x/features/feature_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);


  @override
  Future<DataState<WeatherEntity>> fetchWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callWeatherHeader(cityName);
      if (response.statusCode == 200) {
        WeatherEntity weatherEntity =
            WeatherModel.fromJson(response.data);
        return DataSuccess(weatherEntity);
      } else {
        return const DataFailed("Something went wrong. try Again");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
