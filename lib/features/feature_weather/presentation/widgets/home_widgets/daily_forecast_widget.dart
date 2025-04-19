import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_x/core/widgets/app_background.dart';

import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/second_forecast_weather_status.dart';

class ForecastWidget extends StatefulWidget {
  const ForecastWidget({super.key});

  @override
  State<ForecastWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends State<ForecastWidget> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(20),

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.55,
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
                  const Text("Daily Forecast",
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
              Expanded(child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.weatherStatus is WeatherCompleted) {
                    final forecastWeatherCompleted =
                        state.weatherStatus as WeatherCompleted;

                    final forecastWeatherEntity =
                        forecastWeatherCompleted.weatherEntity;
                    var weatherForecastDays =
                        forecastWeatherEntity.forecast!.forecastDay!.toList();
                    var first7days = weatherForecastDays.sublist(0, 7);
                    var last7days = weatherForecastDays.sublist(7, 14);

                    var pages = [
                      first7days,
                      last7days,
                    ];

                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: PageView.builder(
                            itemCount: pages.length,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            controller: pageController,
                            reverse: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indexPage) {
                              final pageData = pages[indexPage];
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pageData.length,
                                itemBuilder: (context, index) {
                                  final weather = pageData[index];
                                  final dataForecast =
                                      forecastWeatherEntity.forecast!;
                                  final dataCurrent =
                                      forecastWeatherEntity.current!;
                                  DateTime date =
                                      DateTime.parse(weather.date.toString());

                                  DateTime today = DateTime.now();
                                  String weekday =
                                      DateFormat.EEEE().format(date);
                                  bool isToday = date.year == today.year &&
                                      date.month == today.month &&
                                      date.day == today.day;

                                  return Container(
                                    padding: const EdgeInsets.all(5),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                              isToday ? "Today" : weekday,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isToday ? 17 : 13,
                                                  fontWeight: isToday
                                                      ? FontWeight.bold
                                                      : FontWeight.w400)),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "${weather.day!.dailyChanceOfRain
                                                      .toString()
                                                      .toString()}\u0025",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight: isToday
                                                          ? FontWeight.bold
                                                          : FontWeight.w400)),
                                              SvgPicture.asset(
                                                "assets/icons/rain.svg",
                                                width: 20,
                                                height: 20,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: AppBackground.setIconForMain(
                                              dataForecast.forecastDay![index]
                                                  .day!.condition!.text
                                                  .toString()),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${weather.day!.mintempC!.round()}\u00B0",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${weather.day!.maxtempC!.round().toString()}\u00B0",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SmoothPageIndicator(
                            controller: pageController,
                            onDotClicked: (index) =>
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn),
                            count: 2,
                            effect: const ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: 10,
                                dotColor: Colors.white,
                                activeDotColor: Colors.white))
                      ],
                    );
                  }
                  return const SizedBox();
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
