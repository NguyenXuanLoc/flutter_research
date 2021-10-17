import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research/common/share_pref_common.dart';
import 'package:flutter_research/screen/splash/splash_event.dart';
import 'package:flutter_research/screen/splash/splash_state.dart';
import 'package:flutter_research/services/repsitory.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Repository repository = Repository();

  SplashBloc() : super(SplashInitState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is GetApiKeySplashEvent) {
      yield* _getApiKey();
    }
  }

  Stream<SplashState> _getApiKey() async* {
    var result = await repository.getApiKey();
    if (result.data != null) {
      PrefCommon.saveAccessToken(result.data.apiKey);
      yield GetApiKeyState(result.data, DateTime.now().microsecondsSinceEpoch);
    } else
      yield ErrorSplashState(DateTime.now().microsecondsSinceEpoch);
  }
}
