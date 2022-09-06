import 'package:flutter/material.dart';

const Color darkPrimaryColor = Color.fromRGBO(56, 142, 60, 1);
const Color lightPrimaryColor = Color.fromRGBO(200, 230, 201, 1);
const Color primaryColor = Color(0xff90B2F9);
const Color accentColor = Color(0xff90B2F8);
const Color textPrimaryColor = Color.fromRGBO(33, 33, 33, 1);
const Color dividerColor = Color.fromRGBO(189, 189, 189, 1);
final Color? textIconColorGray = Colors.grey[300];
const Color greenColor = Color.fromRGBO(76, 175, 80, 1);
final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const linearGradientBlue = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
    stops: [0.0, 1.0]);
const linearGradientPurple = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xff51087E), Color(0xff6C0BA9)],
    stops: [0.0, 1.0]);

class AppTheme {
  static TextStyle normalWhiteHeadline = const TextStyle(
    color: Colors.white70,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle boldWhiteHeadline = const TextStyle(
    color: Colors.white70,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle normalBlackText = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle normalWhiteText = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle hintText = const TextStyle(
    color: Color(0xffababab),
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bottomNavText = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardText = const TextStyle(
    color: Color(0xff3e3e3e),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle orderText = const TextStyle(
    color: Color(0xffababab),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}
