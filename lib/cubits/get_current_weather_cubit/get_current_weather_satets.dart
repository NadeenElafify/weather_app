
import 'package:weather_app/models/weather_model.dart';

class WeatherState{}
class NoWeatherState extends WeatherState{}
class WeatherSuccessState extends WeatherState{
 final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}
class WeatherErrorState extends WeatherState{
  final String errMessage;

  WeatherErrorState(this.errMessage);
}