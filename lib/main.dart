import 'package:flutter/material.dart';
import 'package:weather_x/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_x/locator.dart';
import 'core/widgets/main_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  /// initialize dependencies and locator
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<HomeBloc>(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<HomeBloc>(context)
        .add(LoadSecondForecastWeatherEvent('Mashhad'));
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
