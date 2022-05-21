import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/repo/user_repository.dart';
import '../../../utils/my_const/color_const.dart';
import 'barrel_login.dart';
import 'bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(userRepository: userRepository),
        child: Container(
          color: ColorConst.primaryColor,
          child: ListView(
            children: <Widget>[
              _buildTopWelcome(),
              _buildLoginForm(),
              _buildBottomSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTopWelcome() => const WidgetTopWelcome();

  _buildLoginForm() => const WidgetLoginForm();

  _buildBottomSignUp() => const WidgetBottomSignUp();
}
