import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '143b75a4254f48678f672618241802';

  WeatherService( this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {//if dio error message
      final String errorMess = e.response?.data['error']['message']??"oops there was an error try later";
      throw Exception(errorMess);
    }catch(e){
      log(e.toString());
      throw Exception('there was an error try later');
      
    }
  }
}
