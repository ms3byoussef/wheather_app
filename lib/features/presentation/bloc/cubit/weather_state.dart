import 'package:equatable/equatable.dart';

import '../../../data/model/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSuccess extends WeatherState {
  final CurrentWeatherModel weather;
  const WeatherStateSuccess({required this.weather});
  @override
  List<Object> get props => [weather];
}

class WeatherOtherLocationsChanged extends WeatherState {}

class WeatherStateFailure extends WeatherState {}
