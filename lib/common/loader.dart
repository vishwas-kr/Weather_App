import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_color.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColor.lightBlue,
    ));
  }
}
