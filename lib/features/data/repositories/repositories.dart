import '../model/weather_model.dart';
import '../web_services/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices? weatherWebServices;
  WeatherRepository({this.weatherWebServices});
  Future<CurrentWeatherModel> getCurrentWeather(String? city) async {
    final currentWeather = await weatherWebServices!.getWeather(city);
    CurrentWeatherModel weather = CurrentWeatherModel.fromJson(currentWeather);

    return weather;
  }

  Future<List<CurrentWeatherModel>> getForecastWeather(String? city) async {
    final weathers = await weatherWebServices!.getWeather(city);
    return weathers
        .map((weather) => CurrentWeatherModel.fromJson(weather))
        .toList();
  }
}
