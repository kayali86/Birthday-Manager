import 'package:meta/meta.dart';

@immutable
class HomeState {
  final bool isLoggingOut;
  final bool isLoggedOut;
  final bool isFailure;

  HomeState({

    required this.isLoggingOut,
    required this.isLoggedOut,
    required this.isFailure,
  });

  factory HomeState.empty() {
    return HomeState(
      isLoggingOut: false,
      isLoggedOut: false,
      isFailure: false,
    );
  }

  factory HomeState.loading() {
    return HomeState(
      isLoggingOut: true,
      isLoggedOut: false,
      isFailure: false,
    );
  }

  factory HomeState.failure() {
    return HomeState(
      isLoggedOut: false,
      isLoggingOut: false,
      isFailure: true,
    );
  }

  factory HomeState.success() {
    return HomeState(
      isLoggingOut: false,
      isLoggedOut: true,
      isFailure: false,
    );
  }
}
