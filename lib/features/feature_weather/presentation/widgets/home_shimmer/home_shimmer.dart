import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_x/core/widgets/app_background.dart';
import 'package:weather_x/features/feature_weather/presentation/widgets/home_shimmer/daily_forecast_shimmer.dart';
import 'package:weather_x/features/feature_weather/presentation/widgets/home_shimmer/hourly_forecast_shimmer.dart';

class HomeShimmer extends StatefulWidget {
  const HomeShimmer({super.key});

  @override
  State<HomeShimmer> createState() => _HomeShimmerState();
}

class _HomeShimmerState extends State<HomeShimmer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SvgPicture.asset(
                    "assets/icons/location_pin.svg",
                    color: Colors.white,
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 50,
                    height: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade200.withOpacity(0.1),
                      highlightColor: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/notification.svg",
                    color: Colors.white,
                    height: 25,
                    width: 25,
                  )
                ]),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.22,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200.withOpacity(0.1),
                highlightColor: Colors.white,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                  ),

                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.119,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200.withOpacity(0.1),
                highlightColor: Colors.white,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                  ),

                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/rain.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade200.withOpacity(0.1),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/humidity_light.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade200.withOpacity(0.1),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/windy_strong.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade200.withOpacity(0.1),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            // const TodayWeatherWidget(),

            const TodayShimmerWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            const ForecastShimmerWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.439,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SvgPicture.asset(
                            "assets/icons/sunrise.svg",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.015,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade200.withOpacity(0.1),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.439,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/sunset.svg",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.015,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade200.withOpacity(0.1),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            // const ForecastWidget(),
          ],
        ),
      ),
    );
  }
}
