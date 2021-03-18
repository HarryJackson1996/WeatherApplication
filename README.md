# Weather Application
A Flutter weather application that displays the current weather and 5 day forecast for different cities.

# Installing 
1. Download the main branch of this repository.
2. Add your own OpenWeatherMap API key to the weather_client.dart file (WeatherClient class). The location of the file is: weather-application/weather_application/lib/clients/weather_client.dart.
```
class WeatherClient {
  final String _apiKey = 'INSERT API KEY HERE'
}
```
3. Once the API key has been added you should be good to go. You can either run the application on a simulator if you want to debug/alter the application. If you just want to view the app you can run the command flutter run --release in the terminal from the root of the Flutter application.


# Future work/ Todo
 - Include location services: Currently the intial location is defaulted to London.
 - Implement Google place search API for the search screen: This would allow the application to display related city results in real-time as the user starts to search for a city.
 - Responsiveness: Making sure the UI looks good on tablet would be ideal. 
 - Language support (internationalising the app).
 - Test iOS, this application was developed and tested on Android devices.

# Acknowledgements 
<div>Icons made by <a href="https://www.flaticon.com/authors/bqlqn" title="bqlqn">bqlqn</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
