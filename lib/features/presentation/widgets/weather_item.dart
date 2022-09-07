import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class WeatherItem extends StatelessWidget {
  final String value;
  final String unit;
  final String imageUrl;
  final String time;

  const WeatherItem({
    Key? key,
    required this.value,
    required this.unit,
    required this.imageUrl,
    required this.time,
  }) : super(key: key);

  get linearGradientBlue => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 120,
      width: 70,
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
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset('assets/images/$imageUrl.png'),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            value.toString() + unit,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
