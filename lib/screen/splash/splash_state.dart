import 'package:flutter_research/model/api_key_model.dart';

abstract class SplashState {}

class SplashInitState extends SplashState {}

class GetApiKeyState extends SplashState {
  final ApiKey key;
  final int time;

  GetApiKeyState(this.key, this.time);
}

class ErrorSplashState extends SplashState {
  final int time;

  ErrorSplashState(this.time);

}
