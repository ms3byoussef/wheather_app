// ignore_for_file: unused_local_variable

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/data/model/weather_model.dart';
import 'package:weather_app/features/presentation/bloc/cubit/weather_cubit.dart';

import '../../../../core/theme/app_theme.dart';
import '../../bloc/cubit/weather_state.dart';
import '../../widgets/weather_item.dart';
import 'widgets/icon_with_text.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  buildMainContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: MediaQuery.of(context).size.height * .7,
        decoration: BoxDecoration(
          gradient: linearGradientBlue,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            buildCityTitle(),
            buildWeatherImageAndTemp(),
            buildWindyRow(),
          ]),
        ));
  }

  buildCityTitle() {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherStateSuccess) {
          CurrentWeatherModel weather = state.weather;
          var weatherCubit = BlocProvider.of<WeatherCubit>(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    weather.location.name,
                    style: AppTheme.boldWhiteHeadline,
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) async {
                          await weatherCubit.getData(country: country.name);
                        },
                      );

                      // showModalBottomSheet(
                      //     isScrollControlled: true,
                      //     isDismissible: true,
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(
                      //           top: Radius.circular(20),
                      //           bottom: Radius.circular(20)),
                      //     ),
                      //     context: context,
                      //     enableDrag: true,
                      //     builder: (_) => SearchBar(
                      //           controller: searchController,
                      //           onTap: () async {
                      //             await BlocProvider.of<WeatherCubit>(context)
                      //                 .getWeather(city: searchController.text);
                      //           },
                      //         ));
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()).toString(),
                style: AppTheme.normalWhiteText,
              ),
              const SizedBox(height: 20),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  buildWindyRow() {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherStateSuccess) {
          CurrentWeatherModel weather = state.weather;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithText(
                    title: "${weather.current.windSpeedKM}"
                        " km/h",
                    image: "windspeed.png"),
                IconWithText(
                    title: "${weather.current.humidity}"
                        "%",
                    image: "humidity.png"),
                IconWithText(
                    title: "${weather.current.cloud}"
                        "%",
                    image: "cloud.png"),
              ],
            ),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showProgressIndicator(),
              showProgressIndicator(),
              showProgressIndicator(),
            ],
          );
        }
      },
    );
  }

  buildWeatherImageAndTemp() {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherStateSuccess) {
          CurrentWeatherModel weather = state.weather;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.asset("assets/images/showers.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${weather.current.tempC} "
                    "C??",
                    style: AppTheme.boldWhiteHeadline.copyWith(fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${weather.current.tempF} "
                    "F??",
                    style: AppTheme.boldWhiteHeadline.copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    weather.current.conditionText,
                    style: AppTheme.boldWhiteHeadline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white54,
                  height: 1.4,
                )
              ],
            ),
          );
        } else {
          return showProgressIndicator();
        }
      },
    );
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: primaryColor),
    );
  }

  buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 550,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(background: buildMainContainer()),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    margin: const EdgeInsets.all(14),
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BlocBuilder<WeatherCubit, WeatherState>(
                        builder: (context, state) {
                          if (state is WeatherStateSuccess) {
                            CurrentWeatherModel weather = state.weather;

                            return Column(
                              children: [
                                // WeatherChart(),
                                Row(children: [
                                  WeatherItem(
                                    value: "Sun",
                                    unit: "Raise",
                                    imageUrl: "sunrise",
                                    time: weather.forecastAstro!.sunRise
                                        .toString(),
                                  ),
                                  WeatherItem(
                                    value: "Sun",
                                    unit: "Raise",
                                    imageUrl: "sunset",
                                    time: weather.forecastAstro!.sunSet
                                        .toString(),
                                  ),
                                  WeatherItem(
                                    value: "Moon",
                                    unit: "Raise",
                                    imageUrl: "moon",
                                    time: weather.forecastAstro!.moonRise
                                        .toString(),
                                  ),
                                  WeatherItem(
                                    value: "Moon",
                                    unit: "set",
                                    imageUrl: "moonset",
                                    time: weather.forecastAstro!.moonSet
                                        .toString(),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
