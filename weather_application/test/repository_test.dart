import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/repositories/hive_repository.dart';

class MockRepository extends Mock {}

main() async {
  await Hive.initFlutter();
  HiveRepository<Weather> testRepository;
  Hive.registerAdapter(WeatherAdapter());

  setUp(() async {
    testRepository = HiveRepository(await Hive.openBox<Weather>('test'));
  });

  test('Should cache the data', () async {
    await testRepository.put('test', Weather(name: 'test', temp: '20.0'));
    Weather weather = await testRepository.get('test');
    expect(weather.name, 'test');
    expect(weather.temp, '20.0');
  });
}
