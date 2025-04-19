import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class AppBackground {
  static Color getBackgroundColor() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 17) {
      // Daytime: 6 AM - 6 PM
      return const Color(0xff29B2DD);
    } else if ((hour >= 17 && hour < 20) || (hour >= 4 && hour < 6)) {
      // Transition times: 6 PM - 8 PM or 4 AM - 6 AM
      return const Color(0xff08244F);
    } else {
      // Nighttime: 8 PM - 4 AM
      return const Color(0xFF000000);
    }
  }

  static LinearGradient getGradiantColor() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 17) {
      // Daytime: 6 AM - 6 PM
      return const LinearGradient(
        colors: [Color(0xff29B2DD), Color(0xff33AADD), Color(0xff2DC8EA)],
        // blue shades
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      );
    } else if ((hour >= 17 && hour < 20) || (hour >= 4 && hour < 6)) {
      // Transition times: 6 PM - 8 PM or 4 AM - 6 AM
      return const LinearGradient(
        colors: [Color(0xff08244F), Color(0xff134CB5), Color(0xff0B42AB)],
        // blue shades
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      );
    } else {
      // Nighttime: 8 PM - 4 AM
      return const LinearGradient(
        colors: [Color(0xFF0D47A1), Color(0xFF000000)], // dark blue to black
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      );
    }
  }

  static SvgPicture setIconForMain(description) {
    final hour = DateTime.now().hour;
    if (description == "clear sky") {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/sunny.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/clear.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description == "few clouds") {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/partly_cloudy.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/partly_cloudy.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description.contains("clouds")) {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/cloudy.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/cloudy.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description.contains("thunderstorm")) {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/thundery_outbreaks_possible.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/thundery_outbreaks_possible.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description.contains("drizzle")) {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/moderate_rain.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/moderate_rain.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description.contains("rain")) {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/light_rain.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/light_rain.svg',
          fit: BoxFit.cover,
        );
      }
    } else if (description.contains("snow")) {
      if (hour >= 5 && hour < 17) {
        return SvgPicture.asset(
          'assets/icons/icon_day/heavy_snow.svg',
          fit: BoxFit.cover,
        );
      } else {
        return SvgPicture.asset(
          'assets/icons/icon_night/heavy_snow.svg',
          fit: BoxFit.cover,
        );
      }
    } else {
      return SvgPicture.asset(
        'assets/icons/icon_day/fog.svg',
        fit: BoxFit.cover,
      );
    }
  }
}
