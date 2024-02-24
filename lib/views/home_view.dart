import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/error_view.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder <GetWeatherCubit ,WeatherState>(
        builder: (context, state){
          if(state is WeatherInitialState){
            return SearchView();
          }
          else if (state is WeatherLoadedState){
            return WeatherView(weatherModel: state.weatherModel);
          }
          else {
            return const ErrorView();
          }
        },
      ),
    );
  }
}