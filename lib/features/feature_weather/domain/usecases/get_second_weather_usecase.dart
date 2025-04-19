import 'package:weather_x/core/params/forecast_params.dart';
import 'package:weather_x/core/resources/data_state.dart';
import 'package:weather_x/core/usecase/usecase.dart';
import 'package:weather_x/features/feature_weather/domain/entities/forecast_entity.dart';
import 'package:weather_x/features/feature_weather/domain/repositories/weather_repository.dart';

class WeatherUseCase
    implements UseCase<DataState<WeatherEntity>, String> {
  final WeatherRepository weatherRepository;

  WeatherUseCase(this.weatherRepository);
  @override
  Future<DataState<WeatherEntity>> call(String cityName) {
    return weatherRepository.fetchWeatherData(cityName);
  }

}
