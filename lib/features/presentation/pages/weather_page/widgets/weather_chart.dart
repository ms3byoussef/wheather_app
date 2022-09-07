import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:weather_app/features/data/model/weather_model.dart';

import '../../../bloc/cubit/weather_cubit.dart';
import '../../../bloc/cubit/weather_state.dart';

class WeatherChart extends StatelessWidget {
  const WeatherChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, states) {
      WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);

      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
            primaryXAxis: CategoryAxis(interval: 1),
            series: <ChartSeries<CurrentWeatherModel, String>>[
              SplineSeries<CurrentWeatherModel, String>(
                  dataSource: weatherCubit.forecastWeather!,
                  xValueMapper: (CurrentWeatherModel f, _) {
                    var time = f.forecastHour!.first.time;
                    return time;
                  },
                  yValueMapper: (CurrentWeatherModel f, _) =>
                      f.forecastHour!.first.tempC),
            ],
          ),
        ),
      );
    });
  }
}
