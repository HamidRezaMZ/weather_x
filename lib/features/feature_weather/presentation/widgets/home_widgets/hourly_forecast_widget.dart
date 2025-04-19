import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_x/core/widgets/app_background.dart';

import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/second_forecast_weather_status.dart';

class TodayWeatherWidget extends StatefulWidget {
  const TodayWeatherWidget({super.key});

  @override
  State<TodayWeatherWidget> createState() => _TodayWeatherWidgetState();
}

class _TodayWeatherWidgetState extends State<TodayWeatherWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hourly Forecast",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    color: Colors.white,
                    width: 25,
                    height: 25,
                  )
                ],
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.weatherStatus is WeatherCompleted) {
                      final forecastWeatherCompleted =
                          state.weatherStatus as WeatherCompleted;
                      final dataForecast =
                          forecastWeatherCompleted.weatherEntity;

                      return ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: dataForecast.forecast!.forecastDay!.length,
                        hitTestBehavior: HitTestBehavior.translucent,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data =
                              dataForecast.forecast!.forecastDay![index];
                          final formattedTime = DateFormat('HH:mm').format(
                              DateTime.parse(dataForecast.forecast!
                                  .forecastDay![index].hour![index].time
                                  .toString()));

                          return Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.2,
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${dataForecast.forecast!.forecastDay![index].day!.maxtempC!.round().toString()}\u00B0",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                AppBackground.setIconForMain(dataForecast
                                    .forecast!
                                    .forecastDay![index]
                                    .day!
                                    .condition!
                                    .text
                                    .toString()),
                                Text(
                                  formattedTime,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
