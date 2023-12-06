import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/main.dart';
import 'package:weather_application/models/weather_model.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherModel.image.contains('https:')
                    ? Image.network(
                        weatherModel.image,
                      )
                    : Image.network('https:${weatherModel.image}'),
                Text(
                  '${weatherModel.temp.round()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.tempMax.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.tempMin.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
