import 'package:birthday_manager/model/entity/user.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState {
  final bool isLoggingOut;
  final bool isLoggedOut;
  final bool isFailure;
  final String message;
  final List<BmUser> users;

  const HomeState({
    required this.isLoggingOut,
    required this.isLoggedOut,
    required this.isFailure,
    required this.message,
    required this.users,
  });

  factory HomeState.initial() {
    return HomeState(
        isLoggingOut: false,
        isLoggedOut: false,
        isFailure: false,
        message: "",
        users: List.empty());
  }

  factory HomeState.dataLoaded(List<BmUser> users) {
    return HomeState(
        isLoggingOut: false,
        isLoggedOut: false,
        isFailure: false,
        message: "",
        users: users);
  }

  factory HomeState.loading(String message) {
    return HomeState(
        isLoggingOut: true,
        isLoggedOut: false,
        isFailure: false,
        message: message,
        users: List.empty());
  }

  factory HomeState.failure(String message) {
    return HomeState(
        isLoggedOut: false,
        isLoggingOut: false,
        isFailure: true,
        message: message,
        users: List.empty());
  }

  factory HomeState.logoutSuccess() {
    return HomeState(
        isLoggingOut: false,
        isLoggedOut: true,
        isFailure: false,
        message: "",
        users: List.empty());
  }
}
