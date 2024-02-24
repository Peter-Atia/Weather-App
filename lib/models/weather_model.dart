class WeatherModel {
  WeatherModel({
    required this.cityName,
    required this.updatedTime,
    required this.image,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStatus,
  });
  final String cityName;
  final String updatedTime;
  final String image;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;
  factory WeatherModel.json(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      updatedTime: json["current"]["last_updated"],
      image: "https:${json["current"]["condition"]["icon"]}",
      currentTemp: json["current"]["temp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherStatus: json["current"]["condition"]["text"],
    );
  }
}
