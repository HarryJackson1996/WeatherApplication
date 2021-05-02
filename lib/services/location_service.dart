import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/consts/consts.dart';
import 'package:weather_application/locator.dart';
import 'package:weather_application/models/settings_model.dart';
import 'package:weather_application/screens/search/search_screen.dart';
import 'package:weather_application/services/analytics_service.dart';

class LocationService {
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<dynamic> getLastKnownPosition() async {
    Position position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      return position;
    } else {
      return "No known last position";
    }
  }

  Future<LocationPermission> requestPermissions() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  Future<LocationPermission> checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission;
  }

  Future<void> checkAndRequestPermissions(BuildContext context) async {
    if (await Geolocator.isLocationServiceEnabled() == true) {
      if (BlocProvider.of<SettingsBloc>(context).state.settings.locationPermissions == null) {
        LocationPermission permission = await requestPermissions();
        await handlePermissions(permission, context);
      } else {
        LocationPermission permission = await checkPermissions();
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          await Geolocator.openAppSettings();
        } else {
          await handlePermissions(permission, context);
        }
      }
    } else {
      showSearch(
        context: context,
        delegate: SearchScreen(),
      );
    }
  }

  Future<void> handlePermissions(
    LocationPermission permission,
    BuildContext context,
  ) async {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        await getLocation().then(
          (value) async => {
            BlocProvider.of<WeatherBloc>(context).add(
              WeatherFetchedEvent(
                id: weatherBoxKey,
                lat: value.latitude.toString(),
                lon: value.longitude.toString(),
              ),
            ),
            BlocProvider.of<SettingsBloc>(context).add(
              OnboardingUpdatedEvent(
                settingsBoxKey,
                onboarding: true,
              ),
            ),
            await getIt<AnalyticsService>().trackPermission(permission),
            Navigator.pushReplacementNamed(context, homeRoute),
          },
        );
        break;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        BlocProvider.of<SettingsBloc>(context).add(
          LocationUpdatedEvent(
            settingsBoxKey,
            permissions: LocationPermissions.DENIED,
          ),
        );
        await getIt<AnalyticsService>().trackPermission(permission);
        break;
      default:
    }
  }
}
