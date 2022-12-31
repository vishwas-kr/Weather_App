import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/provider/services/weather_provider.dart';
import 'package:weather_app/utils/app_color.dart';
import 'package:weather_app/view/homeScreen/widgets/image_data.dart';

import '../../../common/loader.dart';

class Nextdays extends StatelessWidget {
  const Nextdays({super.key});
  String getTime(final dtTxt) {
    DateTime time = DateTime.parse(dtTxt);
    String x = DateFormat('jm').format(time);
    return x;
  }

  String getDay(final dtTxt) {
    DateTime time = DateTime.parse(dtTxt);
    String x = DateFormat('EEEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = Provider.of<WeatherProvider>(context);
    return SizedBox(
      height: size.height / 5,
      width: size.width,
      child: FutureBuilder<ActualNextDaysWeather>(
          future: data.getNextDaysWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Opps! Try again later!"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            } else if (snapshot.hasData) {
              var nextData = snapshot.data as ActualNextDaysWeather;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: nextData.list!.length - 25,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width / 4,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColor.lightBlack.withOpacity(0.3),
                      border: Border.all(color: AppColor.lightBlack),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          getDay(nextData.list![index]!.dtTxt),
                          style: const TextStyle(
                            color: AppColor.grey,
                            fontSize: 16,
                          ),
                        ),
                        Image.asset(
                          'assets/weather/${nextData.list![index]!.weather![0]!.icon}.png',
                          height: size.height * 0.08,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(getTime(nextData.list![index]!.dtTxt)),
                        Text(
                          '${nextData.list![index]!.main!.temp!.toInt()}°',
                          style: const TextStyle(
                              color: AppColor.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Loader();
          }),
    );
  }
}
