


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_wather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search a City')),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
           onSubmitted: (value)async{
            Navigator.pop(context);  
            var getWeatherCubit=BlocProvider.of<GetCurrentWeatherCubit>(context);
             getWeatherCubit.getCurrentWeather(cityName: value);
                
           },
            decoration:const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              labelText:'Search' ,
              hintText: ' Enter city name',
              suffixIcon:  Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide:  BorderSide(
                  color: Colors.green,
                ),
             ),
            ),
          ),
        ),
      ),
    );
  }
}