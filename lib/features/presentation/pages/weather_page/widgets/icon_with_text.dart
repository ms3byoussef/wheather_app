import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/theme/app_theme.dart';

class IconWithText extends StatelessWidget {
  final String title;
  final String image;
  const IconWithText({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/$image',
          width: 50,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          title,
          style: AppTheme.normalWhiteText,
        )
      ],
    );
  }
}
