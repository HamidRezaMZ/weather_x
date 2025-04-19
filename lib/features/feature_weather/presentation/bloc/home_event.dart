part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadCurrentWeatherEvent extends HomeEvent {
  final String cityName; // city name

  LoadCurrentWeatherEvent(this.cityName);
}
class LoadForecastWeatherEvent extends HomeEvent {
  final String cityName;

  LoadForecastWeatherEvent(this.cityName);


}
class LoadSecondForecastWeatherEvent extends HomeEvent {
  final String cityName;

  LoadSecondForecastWeatherEvent(this.cityName);


}