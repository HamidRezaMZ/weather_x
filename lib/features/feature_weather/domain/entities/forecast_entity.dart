
import 'package:equatable/equatable.dart';

import 'package:weather_x/features/feature_weather/data/models/forecast_weather_model.dart';





class WeatherEntity extends Equatable{
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  const WeatherEntity({this.location, this.current, this.forecast});

  @override
  // TODO: implement props
  List<Object?> get props => [
    location,
    current,
    forecast
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}