
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_x/core/widgets/app_background.dart';


import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/second_forecast_weather_status.dart';

import 'package:weather_x/features/feature_weather/presentation/widgets/home_shimmer/home_shimmer.dart';
import 'package:weather_x/features/feature_weather/presentation/widgets/home_widgets/home_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {

        BlocProvider.of<HomeBloc>(context)
            .add(LoadSecondForecastWeatherEvent('Mashhad'));
      },
      displacement: 50,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(gradient: AppBackground.getGradiantColor()),
        child: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) {
              if (previous.weatherStatus ==
                  current.weatherStatus) {
                return false;
              } else {
                return true;
              }
            },
            builder: (context, state) {
              if (state.weatherStatus
                  is WeatherCompleted) {
                final currentWeatherCompleted =
                    state.weatherStatus
                        as WeatherCompleted;
                final currentCityEntity =
                    currentWeatherCompleted.weatherEntity;
                //print(MediaQuery.of(context).size.width * 0.01); /// ---> 4.48
                //print(MediaQuery.of(context).size.height * 0.01); /// ----- ): 9.733333333333334
                // print(MediaQuery.of(context).size.width);
                // currentCityEntity.current!.airQuality!.gbDefraIndex.toString();
                return HomeWidget(currentCityEntity: currentCityEntity,);
              }
              if (state.weatherStatus
                  is WeatherLoading) {
                return const HomeShimmer();


              }
              if (state.weatherStatus is WeatherError) {
                final currentWeatherError = state.weatherStatus
                    as WeatherError;
                return Center(
                  child: Text(currentWeatherError.errorMessage.toString()),
                );
              } else {
                return const Center(
                  child: Text("Error"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
