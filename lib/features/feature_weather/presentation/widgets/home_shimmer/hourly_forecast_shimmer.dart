import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class TodayShimmerWidget extends StatelessWidget {
  const TodayShimmerWidget({super.key});

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
                child: ListView.builder(

                  physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  hitTestBehavior: HitTestBehavior.translucent,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {


                    return Container(
                      width: MediaQuery.of(context).size.width * 0.2,

                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01,left: MediaQuery.of(context).size.width * 0.01),
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
                    );
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
