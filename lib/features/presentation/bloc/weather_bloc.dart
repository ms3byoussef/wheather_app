// import 'package:bloc/bloc.dart';
// import 'package:weather_app/features/data/model/weather_model.dart';
// import 'package:weather_app/features/presentation/bloc/weather_event.dart';
// import 'package:weather_app/features/presentation/bloc/weather_state.dart';

// import '../../data/repositories/repositories.dart';

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final WeatherRepository weatherRepository;
//   WeatherBloc({required this.weatherRepository}) : super(WeatherInitial());
//   Stream<WeatherState> mapEventToState(WeatherEvent weatherEvent) async* {
//     if (weatherEvent is WeatherEventRequested) {
//       yield WeatherStateLoading();
//       try {
//         final CurrentWeatherModel weather =
//             await weatherRepository.getCurrentWeather(weatherEvent.city);
//         yield WeatherStateSuccess(weather: weather);
//       } catch (exception) {
//         yield WeatherStateFailure();
//       }
//     } else if (weatherEvent is WeatherEventRefresh) {
//       try {
//         final CurrentWeatherModel weather =
//             await weatherRepository.getCurrentWeather(weatherEvent.city);
//         yield WeatherStateSuccess(weather: weather);
//       } catch (exception) {
//         yield WeatherStateFailure();
//       }
//     }
//   }
// }
