import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/loader.dart';
import 'package:weather_app/provider/services/weather_provider.dart';
import 'package:weather_app/utils/app_color.dart';
import 'package:weather_app/utils/location_permission.dart';
import 'package:weather_app/view/homeScreen/widgets/current_weather_container.dart';
import 'package:weather_app/view/homeScreen/widgets/next_days.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dateTime = DateFormat("yMMMMd").format(DateTime.now());
  bool loading = true;
  @override
  void initState() {
    super.initState();
    checkLocationPermission();

    getlocation();
  }

  getlocation() async {
    setState(() {
      loading = true;
    });

    await Provider.of<WeatherProvider>(context, listen: false)
        .getcurrentLocation();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color(0xff161C2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: provider.city,
                style: const TextStyle(color: AppColor.white, fontSize: 24),
              ),
              TextSpan(
                text: ' ${provider.state}',
                style: const TextStyle(color: AppColor.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
      body: loading == false
          ? ListView(
              children: [
                //Image.asset('assets/sunny.png'),
                const Text(
                  "Today",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  dateTime,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColor.grey),
                ),
                const SizedBox(height: 20),
                const CurrentWeatherContainer(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Hourly",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                const Nextdays(),
                const SizedBox(height: 20),
              ],
            )
          : const Loader(),
    );
  }
}
