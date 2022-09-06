import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/features/data/model/weather_model.dart';
import 'package:weather_app/features/data/repositories/repositories.dart';
import 'package:weather_app/features/presentation/bloc/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  CurrentWeatherModel? weather;
  List<CurrentWeatherModel>? forecastWeatherModel;
  GetStorage storage = GetStorage();
  List<String> otherLocations = [];
  int? selectedOtherLocation;

  Future<CurrentWeatherModel> getWeather({String? city}) async {
    weather = null;
    emit(WeatherStateLoading());

    CurrentWeatherModel weatherModel =
        await weatherRepository.getCurrentWeather(city);
    emit(WeatherStateSuccess(weather: weatherModel));
    weather = weatherModel;

    return weatherModel;
  }

  void loadOtherLocations() {
    try {
      if (storage.read<String>('otherLocations') != null) {
        List<dynamic> dataFromJson =
            json.decode(storage.read<String>('otherLocations')!);
        for (var element in dataFromJson) {
          otherLocations.add(element);
        }
      }
      selectedOtherLocation = storage.read('selectedOtherLocation');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future _saveOtherLocations() async {
    await storage.write('otherLocations', json.encode(otherLocations));
  }

  void changeSelectedOtherLocation(int index) {
    selectedOtherLocation = index;
    storage.write('selectedOtherLocation', selectedOtherLocation);
    emit(WeatherOtherLocationsChanged());
  }

  void addOtherLocation(String country) async {
    if (otherLocations.contains(country)) {}
    otherLocations.add(country);
    await _saveOtherLocations();
    selectedOtherLocation = otherLocations.length - 1;
    emit(WeatherOtherLocationsChanged());
  }

  void removeOtherLocation(int index) {
    otherLocations.removeAt(index);
    _saveOtherLocations();
    if (selectedOtherLocation == index) {
      selectedOtherLocation = null;
      storage.write('selectedOtherLocation', selectedOtherLocation);
    } else if (selectedOtherLocation != null &&
        index < selectedOtherLocation!) {
      selectedOtherLocation = selectedOtherLocation! - 1;
    }
    emit(WeatherOtherLocationsChanged());
  }

  getData({String country = "London"}) async {
    weather = null;
    emit(WeatherInitial());
    String? favCountry = storage.read('favCountry');
    try {
      var dataWeather =
          await weatherRepository.getCurrentWeather(favCountry ?? country);
      emit(WeatherStateSuccess(weather: dataWeather));
      weather = dataWeather;
      if (weather != null) {
        return weather;
      }
    } catch (error) {
      emit(WeatherStateFailure());
      error.toString();
    }
  }

  // void getDataByCountry(String country) async {
  //   weather = null;
  //   emit(WeatherInitStates());

  //   var data = await getWeatherByCountryNameUseCase.execute(country);
  //   data.fold(
  //     (error) {
  //       emit(WeatherErrorStates(error.messages));
  //     },
  //     (data) {
  //       weatherModel = data;
  //     },
  //   );
  //   if (weatherModel == null) {
  //     return;
  //   }
  //   var dataForcast =
  //       await getForcastWeatherByCountryNameUseCase.execute(country);
  //   dataForcast.fold(
  //     (error) {
  //       emit(WeatherErrorStates(error.messages));
  //       return;
  //     },
  //     (data) {
  //       forecastWeatherModel = data;
  //       emit(WeatherGetData());
  //     },
  //   );
  // }
}
