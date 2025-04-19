
import 'package:weather_x/core/resources/data_state.dart';

import 'package:weather_x/features/feature_weather/domain/entities/forecast_entity.dart';

abstract class WeatherRepository {

  Future<DataState<WeatherEntity>> fetchWeatherData(
      String cityName);
}
