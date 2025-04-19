import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_x/core/widgets/app_background.dart';
import 'package:weather_x/features/feature_weather/presentation/widgets/home_widgets/daily_forecast_widget.dart';
import 'package:weather_x/features/feature_weather/presentation/widgets/home_widgets/hourly_forecast_widget.dart';

class HomeWidget extends StatefulWidget {
  final dynamic currentCityEntity;

  const HomeWidget({super.key, required this.currentCityEntity});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20,bottom: 20),
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
                  Text(
                    widget.currentCityEntity.location!.name.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
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
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.22,
              child: AppBackground.setIconForMain(
                widget.currentCityEntity.current!.condition!.text.toString(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "${widget.currentCityEntity.current!.tempC!.round().toString()}\u00B0",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.currentCityEntity.current!.condition!.text.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
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
                          Text(
                            "${widget.currentCityEntity.forecast!.forecastDay![0].day!.dailyChanceOfRain!.toString()}\u0025",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
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
                          Text(
                            widget.currentCityEntity.current!.humidity
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
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
                          Text(
                            "${widget.currentCityEntity.current!.windKph!.round().toString()}km/h",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
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
            const TodayWeatherWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            const ForecastWidget(),
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
                          Text(
                            widget.currentCityEntity.forecast!.forecastDay![0]
                                .astro!.sunrise
                                .toString(),
                            style: const TextStyle(color: Colors.white,fontSize: 20),
                          )
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
                          Text(
                            widget.currentCityEntity.forecast!.forecastDay![0]
                                .astro!.sunset
                                .toString(),
                            style: const TextStyle(color: Colors.white,fontSize: 20),
                          )
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text("pm2-5",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.pm25}",style: const TextStyle(color: Colors.white,fontSize: 20),),


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
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text("pm-10",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.pm10}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],
                      ),
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("US AQI",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.usEpaIndex}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],

                      ),
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("UK AQI",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.gbDefraIndex}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],

                      ),
                    ),
                  ),
                )              ],
            ),
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
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("co",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.co}",style: const TextStyle(color: Colors.white,fontSize: 20),),


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
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text("no2",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.no2}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],
                      ),
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text("o3",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.o3}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],
                      ),
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("so2",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${widget.currentCityEntity.current!.airQuality!.so2}",style: const TextStyle(color: Colors.white,fontSize: 20),),


                        ],

                      ),
                    ),
                  ),
                )              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}
