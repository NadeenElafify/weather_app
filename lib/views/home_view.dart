import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_wather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_satets.dart';

import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
          builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeatherBody();
        } else if (state is WeatherSuccessState) {
          return WeatherInfoBody(
            weather: state.weatherModel,
          );
        } else {
          return const Center(child: Text("oppsss there was an error"));
        }
      }),
    );
  }
}
