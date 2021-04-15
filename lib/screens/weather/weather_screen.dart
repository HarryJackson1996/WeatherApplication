import 'package:hive/hive.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/consts/consts.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/weather/widgets/modal/weather_modal.dart';
import 'package:weather_application/widgets/weather_error.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/annotated_scaffold.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/screens/weather/widgets/forecast/forecast_weather.dart';
import 'package:weather_application/screens/weather/widgets/weather/weather_card.dart';
import '../search/search_screen.dart';
import '../../utils/extensions/extensions.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        Weather weather = Hive.box<Weather>(weatherBoxKey).get(weatherBoxKey);
        String myCity = weather?.name ?? 'London';
        if (MyDateUtils.timeDifference(weather.dt, 20)) {
          BlocProvider.of<WeatherBloc>(context).add(
            WeatherFetchedEvent(id: weatherBoxKey, city: myCity, unit: 'Metric'),
          );
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        String myCity;
        if (state is WeatherLoadSuccess) {
          myCity = state.city;
        } else {
          myCity = '';
        }
        return AnnotatedScaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThemedText(
                  myCity,
                  themedTextStyle: ThemedTextStyle.H1,
                )
              ],
            ),
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu_sharp,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                    builder: (context) {
                      return WeatherModal();
                    },
                  );
                },
              );
            }),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () async {
                  showSearch(context: context, delegate: SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, settingsRoute);
                },
              ),
            ],
          ),
          body: _mapWeatherStateToWidget(state),
        );
      },
    );
  }

  Widget _mapWeatherStateToWidget(WeatherState state) {
    if (state is WeatherLoadSuccess) {
      playAndResetAnimation();
      return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<WeatherBloc>(context)
                ..add(
                  WeatherRefreshedEvent(id: weatherBoxKey, weather: state.weather),
                );
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: constraints.biggest.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(
                              right: myPadding,
                              bottom: myPadding / 2,
                              top: myPadding / 2,
                              left: myPadding,
                            ),
                            color: Theme.of(context).backgroundColor,
                            child: CurrentWeatherCard(state.weather, settingsState.settings),
                          ).animate(
                            _controller,
                            start: 0.2,
                            end: 0.7,
                            curve: Curves.linear,
                            animationType: AnimationType.FADE,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            child: ForecastWeather(state.weather.forecast.forecast, settingsState.settings),
                          ).animate(
                            _controller,
                            start: 0.4,
                            end: 0.9,
                            curve: Curves.linear,
                            animationType: AnimationType.FADE,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }
    if (state is WeatherLoadFailure) {
      playAndResetAnimation();
      return WeatherErrorWidget(dioError: state.error).animate(
        _controller,
        start: 0.2,
        end: 0.7,
        curve: Curves.linear,
        animationType: AnimationType.FADE,
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          bottom: AppBar().preferredSize.height,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void playAndResetAnimation() {
    if (_controller == null) {
      _controller = AnimationController(duration: Duration(milliseconds: 1200), vsync: this);
    }
    _controller.reset();
    _controller.forward();
  }
}
