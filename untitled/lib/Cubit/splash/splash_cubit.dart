import 'package:bloc/bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void startAnimation() {
    emit(LoadingSplashState());

    Future.delayed(Duration(seconds: 2), () {
      emit(SplashCompletedState());
    });
  }

  void setError(String errorMessage) {
    emit(ErrorSplashState(errorMessage));
  }
}
