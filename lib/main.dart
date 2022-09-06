import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/network/remote/dio_helper.dart';
import 'package:weather_app/features/data/repositories/repositories.dart';
import 'package:weather_app/features/data/web_services/weather_web_services.dart';
import 'package:weather_app/features/presentation/bloc/cubit/weather_cubit.dart';

import 'features/presentation/screens/get_started.dart';

void main() {
  WeatherRepository weatherRepository =
      WeatherRepository(weatherWebServices: WeatherWebServices());
  DioHelper();
  runApp(MyApp(
    weatherRepository: weatherRepository,
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) =>
              WeatherCubit(weatherRepository: weatherRepository)..getData(),
        )
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Weather app',
          home: GetStarted()),
    );
  }
}
