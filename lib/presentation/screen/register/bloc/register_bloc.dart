import '../../../../model/repo/user_repository.dart';
import '../../../../utils/validators.dart';
import 'bloc.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterState.empty());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password, event.confirmPassword);
    } else if (event is ConfirmPasswordChanged) {
      yield* _mapConfirmPasswordChangedToState(
          event.password, event.confirmPassword);
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password,
          event.confirmPassword, event.displayName, event.birthday);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isPasswordValid = Validators.isValidPassword(password);
    var isMatched = true;

    if (confirmPassword.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
        isPasswordValid: isPasswordValid, isConfirmPasswordValid: isMatched);
  }

  Stream<RegisterState> _mapConfirmPasswordChangedToState(
      String password, String confirmPassword) async* {
    var isConfirmPasswordValid = Validators.isValidPassword(confirmPassword);
    var isMatched = true;

    if (password.isNotEmpty) {
      isMatched = password == confirmPassword;
    }

    yield state.update(
      isConfirmPasswordValid: isConfirmPasswordValid && isMatched,
    );
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: Validators.isValidName(name),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(String email, String password,
      String confirmPassword, String displayName, DateTime birthday) async* {
    //need refactor
    var isValidEmail = Validators.isValidEmail(email);
    var isValidName = displayName.isNotEmpty;
    var isValidBirthday = Validators.isValidBirthday(birthday);

    if (!isValidBirthday) {
      yield RegisterState.failure("Please select your birthday");
      return;
    }

    var isValidPassword = Validators.isValidPassword(password);
    var isValidConfirmPassword = Validators.isValidPassword(confirmPassword);
    var isMatched = true;
    if (isValidPassword && isValidConfirmPassword) {
      isMatched = password == confirmPassword;
    }

    var newState = state.update(
        isEmailValid: isValidEmail,
        isNameValid: isValidName,
        isValidBirthday: isValidBirthday,
        isPasswordValid: isValidPassword,
        isConfirmPasswordValid: isValidConfirmPassword && isMatched);

    yield newState;

    yield RegisterState.failure("Registering Failure");

    if (newState.isFormValid) {
      yield RegisterState.loading("Registering...");

      try {
        await userRepository.signUp(
            email: email,
            password: password,
            displayName: displayName,
            birthday: birthday);
        yield RegisterState.success();
      } catch (_) {
        yield RegisterState.failure("Registering Failure");
      }
    }
  }
}
