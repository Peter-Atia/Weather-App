import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/weather_view.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Search a City",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: cityName);
            },
            decoration: InputDecoration(
              hintText: "Enter City Name",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () async {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: cityName);
                },
                icon:const Icon(Icons.search),
              ),
              labelText: "Search",
            ),
          ),
        ),
      ),
    );
  }
}
