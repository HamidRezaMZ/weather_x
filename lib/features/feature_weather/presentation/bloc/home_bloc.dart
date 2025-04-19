import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_x/core/params/forecast_params.dart';

import 'package:weather_x/core/resources/data_state.dart';

import 'package:weather_x/features/feature_weather/domain/usecases/get_second_weather_usecase.dart';
import 'package:weather_x/features/feature_weather/domain/usecases/get_second_weather_usecase.dart';

import 'package:weather_x/features/feature_weather/presentation/bloc/second_forecast_weather_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final WeatherUseCase weatherUseCase;

  HomeBloc(
      this.weatherUseCase)
      : super(HomeState(

            weatherStatus: WeatherLoading())) {

    on<LoadSecondForecastWeatherEvent>((event, emit) async {
      emit(state.copyWith(
          secondForecastWeatherStatus: WeatherLoading()));
      DataState dataState =
          await weatherUseCase(event.cityName);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            secondForecastWeatherStatus:
                WeatherCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            secondForecastWeatherStatus:
                WeatherError(errorMessage: dataState.error!)));
      }
    });
  }
}
