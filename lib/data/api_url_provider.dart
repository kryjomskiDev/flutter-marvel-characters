import 'package:injectable/injectable.dart';

@singleton
class ApiUrlProvider {
  String getApiUrl() => 'https://gateway.marvel.com:443/v1/public/';
  String apiKey() => '1145bf709166c348f51573ec98c1c654';
  String hash() => '2fc38535bffae4ae1b0adba5a63371ca';
}
