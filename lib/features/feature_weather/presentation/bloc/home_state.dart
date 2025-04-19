part of 'home_bloc.dart';

class HomeState extends Equatable {
  final WeatherStatus weatherStatus;

  const HomeState({required this.weatherStatus});

  HomeState copyWith({WeatherStatus? secondForecastWeatherStatus}) {
    return HomeState(
        weatherStatus: secondForecastWeatherStatus ?? this.weatherStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [weatherStatus];
}
