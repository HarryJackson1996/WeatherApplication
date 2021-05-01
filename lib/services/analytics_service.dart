import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:geolocator/geolocator.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  Future<void> trackEvent(String name, Map<String, dynamic> data) async {
    await _analytics.logEvent(
      name: name,
      parameters: data,
    );
  }

  Future<void> trackSearchEvent(String searchTerm) async {
    await _analytics.logSearch(searchTerm: searchTerm);
  }

  Future<void> trackPermission(LocationPermission permission) async {
    await _analytics.logEvent(
      name: 'location_permissions',
      parameters: {'permission': permission.toString()},
    );
  }
}
