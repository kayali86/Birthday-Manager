import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/auth_bloc/authentication_bloc.dart';
import '../../../app/auth_bloc/authentication_event.dart';
import '../../../model/repo/user_repository.dart';
import '../../../utils/my_const/COLOR_CONST.dart';
import 'bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      body: Center(
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(userRepository: userRepository)..add(LoadData()),
          child: HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {

        if (state.isLoggingOut) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.message),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }

        if (state.isLoggedOut) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        }

        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.message),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${state.users[index].displayName}'),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _onLogOutPressed();
              },
              backgroundColor: COLOR_CONST.ACCENT_COLOR,
              child: const Icon(Icons.logout),
            ),
          );
        },
      ),
    );
  }

  void _onLogOutPressed() {
    _homeBloc.add(LogOut());
  }
}
