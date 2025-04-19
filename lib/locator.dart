import 'package:get_it/get_it.dart';
import 'package:weather_x/features/feature_weather/data/data_sources/remote/api_provider.dart';
import 'package:weather_x/features/feature_weather/data/repositories/weather_repositoryimpl.dart';
import 'package:weather_x/features/feature_weather/domain/repositories/weather_repository.dart';

import 'package:weather_x/features/feature_weather/domain/usecases/get_second_weather_usecase.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  /// repositories
  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  /// use cases

  locator.registerSingleton<WeatherUseCase>(WeatherUseCase(locator()));

  ///bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}
