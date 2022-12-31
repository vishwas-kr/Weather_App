import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/loader.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/provider/services/weather_provider.dart';
import 'package:weather_app/view/homeScreen/widgets/image_data.dart';

import '../../../utils/app_color.dart';

class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = Provider.of<WeatherProvider>(context);
    return SizedBox(
      height: size.height / 2,
      child: FutureBuilder<CurrentWeather>(
          future: data.getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Opps! Try again later!"),
                //child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            } else if (snapshot.hasData) {
              var curData = snapshot.data as CurrentWeather;

              return ClipRRect(
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColor.lightBlack.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColor.lightBlack),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                          'assets/weather/${curData.weather![0].icon}.png'),
                      Text(
                        '${curData.weather![0].description}',
                        style:
                            const TextStyle(color: AppColor.grey, fontSize: 16),
                      ),
                      Text(
                        '${curData.main!.temp!.toInt()}°',
                        style: GoogleFonts.varelaRound(
                          textStyle: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/h.png',
                            height: 35,
                          ),
                          Text(
                            '${curData.main!.tempMax!.toInt()}°',
                            style: const TextStyle(
                                color: AppColor.grey, fontSize: 18),
                          ),
                          const SizedBox(width: 40),
                          Image.asset(
                            'assets/l.png',
                            height: 35,
                          ),
                          Text(
                            '${curData.main!.tempMin!.toInt()}°',
                            style: const TextStyle(
                                color: AppColor.grey, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageData(
                            aseetPath: 'assets/w.png',
                            data: '${curData.wind!.speed!.toInt()} Km/h',
                            label: 'Wind',
                          ),
                          ImageData(
                            aseetPath: 'assets/c.png',
                            data: '${curData.clouds!.all!.toInt()}%',
                            label: 'Clouds',
                          ),
                          ImageData(
                            aseetPath: 'assets/hu.png',
                            data: '${curData.main!.humidity!.toInt()}%',
                            label: 'Humidity',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return const Loader();
          }),
    );
  }
}
