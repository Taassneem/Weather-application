import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c2ed97311b664c7db45221011233011';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oop there was an error, please try again';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oop there was an error, please try again');
    }
  }
}
                