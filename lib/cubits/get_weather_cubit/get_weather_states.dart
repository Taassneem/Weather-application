import 'package:weather_application/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedSuccesfulState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccesfulState(this.weatherModel);
}

class WeatherLoadedFailurState extends WeatherState {}
