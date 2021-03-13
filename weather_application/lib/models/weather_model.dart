class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.windSpeed,
    this.country,
    this.sunrise,
    this.sunset,
    this.dt,
    this.name,
    this.dtTxt,
  });

  int id;
  String main;
  String description;
  String icon;
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int humidity;
  double windSpeed;
  String country;
  int sunrise;
  int sunset;
  int dt;
  String name;
  String dtTxt;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["weather"][0]["id"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      temp: json["main"]["temp"],
      feelsLike: json["main"]["feels_like"].toDouble(),
      tempMin: json["main"]["temp_min"].toDouble(),
      tempMax: json["main"]["temp_max"].toDouble(),
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"],
      country: json["sys"]["country"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
      dt: json["dt"],
      name: json["name"],
      dtTxt: json["dt_txt"] != null ? json["dt_txt"] : null,
    );
  }
}
