import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_wather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_satets.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create object from cubit
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
          builder:(context,state) {
            return MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetCurrentWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );},
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.orange;
    case "Cloudy":
    case "Overcast":
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Blowing snow":
    case "Blizzard":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Mist":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
