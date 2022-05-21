import 'package:birthday_manager/app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import '../app_config.dart';
import '../model/repo/user_repository.dart';
import '../presentation/router.dart';
import '../presentation/screen/home/sc_home.dart';
import '../presentation/screen/login/sc_login.dart';
import '../presentation/screen/splash/sc_splash.dart';
import '../utils/my_const/COLOR_CONST.dart';
import 'auth_bloc/bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;

    return MaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.PRIMARY_COLOR,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: COLOR_CONST.PRIMARY_COLOR),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          } else if (state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated) {
            return HomeScreen();
          }

          return Center(child: Text('Unhandled State $state'));
        },
      ),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_CONST.STATUS_BAR,
      ),
    );
  }

  static Widget runWidget() {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = SimpleBlocObserver();

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final UserRepository userRepository = UserRepository();

          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<UserRepository>(
                  create: (context) => userRepository)
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      AuthenticationBloc(userRepository: userRepository)
                        ..add(AppStarted()),
                ),
              ],
              child: const MyApp(),
            ),
          );
        }

        return Container();
      },
    );
  }
}
