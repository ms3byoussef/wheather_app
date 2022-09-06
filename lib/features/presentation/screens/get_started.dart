import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_theme.dart';

import '../../../core/theme/app_theme.dart';
import '../pages/weather_page/weather_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: primaryColor.withOpacity(.5),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/get-started.png'),
                const SizedBox(
                  height: 30,
                ),
                // SearchBar(
                //   controller: searchController,
                //   onTap: () {
                //     BlocProvider.of<WeatherBloc>(context).add(
                //         WeatherEventRequested(city: searchController.text));
                //   },
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WeatherPage()));
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.7,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
