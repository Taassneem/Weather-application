import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_application/models/weather_model.dart';

import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedSuccesfulState(weatherModel!));
    } catch (e) {
      emit(WeatherLoadedFailurState());
    }
  }
}
