// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../core/network/remote/dio_helper.dart';
import '../../../core/strings/strings.dart';

class WeatherWebServices {
  late Dio dio;
  WeatherWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseApiUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future getWeather(String? city) async {
    try {
      Response response = await DioHelper.getData(url: forecast, query: {
        'key': apiKay,
        'q': city,
        'days': 1,
        'aqi': 'no',
        'alerts': 'no',
      });
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
