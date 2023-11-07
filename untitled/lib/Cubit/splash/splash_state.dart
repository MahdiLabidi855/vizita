
class SplashState  {
  @override
  List<Object?> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashCompletedState extends SplashState {}

class LoadingSplashState extends SplashState {}

class ErrorSplashState extends SplashState {
  final String message;

  ErrorSplashState(this.message);
}
