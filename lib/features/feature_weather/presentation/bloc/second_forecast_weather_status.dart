import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_x/features/feature_weather/domain/entities/forecast_entity.dart';

@immutable
abstract class WeatherStatus extends Equatable {}

class WeatherLoading extends WeatherStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherCompleted extends WeatherStatus {
  final WeatherEntity weatherEntity;

  WeatherCompleted(this.weatherEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [weatherEntity];
}

class WeatherError extends WeatherStatus {
  final String errorMessage;

  WeatherError({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
