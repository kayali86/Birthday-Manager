import 'package:birthday_manager/app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import '../app_config.dart';
import '../model/repo/home_repository.dart';
import '../model/repo/user_repository.dart';
import '../presentation/router.dart';
import '../presentation/screen/home/sc_home.dart';
import '../presentation/screen/login/sc_login.dart';
import '../utils/my_const/COLOR_CONST.dart';
import 'auth_bloc/bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;

    return MaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: COLOR_CONST.PRIMARY_COLOR,
        hoverColor: COLOR_CONST.GREEN,
        fontFamily: 'Poppins', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_CONST.PRIMARY_COLOR),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated) {
            return HomeScreen();
          }

          return Container(
            child: Center(child: Text('Unhandle State $state')),
          );
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
          final HomeRepository homeRepository = HomeRepository();

          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<UserRepository>(
                  create: (context) => userRepository),
              RepositoryProvider<HomeRepository>(
                  create: (context) => homeRepository)
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      AuthenticationBloc(userRepository: userRepository)
                        ..add(AppStarted()),
                ),
              ],
              child: MyApp(),
            ),
          );
        }

        return Container();
      },
    );
  }
}