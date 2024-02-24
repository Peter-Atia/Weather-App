import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "f406469fee54478db30195615241202";
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      return WeatherModel.json(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there is an error ,please try again later";
      throw Exception(errorMessage);
    } catch (e){
      log (e.toString());
      throw Exception("oops there is an error ,please try again later");

    }
  }
}
