import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForecastShimmerWidget extends StatelessWidget {
  const ForecastShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
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
                  const Text("Forecast",
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Shimmer.fromColors(
                                    baseColor:
                                        Colors.grey.shade200.withOpacity(0.1),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Shimmer.fromColors(
                                    baseColor:
                                        Colors.grey.shade200.withOpacity(0.1),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Shimmer.fromColors(
                                    baseColor:
                                        Colors.grey.shade200.withOpacity(0.1),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Shimmer.fromColors(
                                    baseColor:
                                        Colors.grey.shade200.withOpacity(0.1),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
