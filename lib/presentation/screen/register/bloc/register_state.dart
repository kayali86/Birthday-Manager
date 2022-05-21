import 'package:meta/meta.dart';

@immutable
class RegisterState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isNameValid;
  final bool isBirthdayValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid =>
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid &&
      isNameValid &&
      isBirthdayValid;

  const RegisterState(
      {required this.isEmailValid,
      required this.isPasswordValid,
      required this.isConfirmPasswordValid,
      required this.isNameValid,
      required this.isBirthdayValid,
      required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure,
      required this.message});

  factory RegisterState.empty() {
    return const RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isNameValid: true,
        isBirthdayValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: "");
  }

  factory RegisterState.loading(String message) {
    return RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isNameValid: true,
      isBirthdayValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      message: message,
    );
  }

  factory RegisterState.failure(String message) {
    return RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isNameValid: true,
        isBirthdayValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory RegisterState.success() {
    return const RegisterState(
        isEmailValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isNameValid: true,
        isBirthdayValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        message: "");
  }

  RegisterState update({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isNameValid,
    bool? isValidBirthday,
    bool? isConfirmPasswordValid,
  }) {
    return copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isConfirmPasswordValid: isConfirmPasswordValid,
        isNameValid: isNameValid,
        isBirthdayValid: isValidBirthday,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: "");
  }

  RegisterState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isNameValid,
    bool? isBirthdayValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
  }) {
    return RegisterState(
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isConfirmPasswordValid:
            isConfirmPasswordValid ?? this.isConfirmPasswordValid,
        isNameValid: isNameValid ?? this.isNameValid,
        isBirthdayValid: isBirthdayValid ?? this.isBirthdayValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        message: message ?? this.message);
  }

  @override
  String toString() {
    return 'RegisterState{isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid, isNameValid: $isNameValid, isBirthdayValid: $isBirthdayValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, message: $message}';
  }
}
