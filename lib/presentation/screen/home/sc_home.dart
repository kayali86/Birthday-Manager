import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../app/auth_bloc/authentication_bloc.dart';
import '../../../app/auth_bloc/authentication_event.dart';
import '../../../model/repo/user_repository.dart';
import '../../../utils/my_const/color_const.dart';
import 'bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      body: Center(
        child: BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc(userRepository: userRepository)..add(LoadData()),
          child: const HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

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
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.message),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }

        if (state.isLoggedOut) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        }

        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.message),
                    const Icon(Icons.error),
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
                return Card(
                    child: ListTile(
                        leading: const Icon(Icons.person),
                        iconColor: ColorConst.primaryColor,
                        title: Text(state.users[index].displayName),
                        textColor: ColorConst.darkPrimaryColor,
                        subtitle: Text(
                            _getFormattedBirthday(state.users[index].birthday))));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _onLogOutPressed();
              },
              backgroundColor: ColorConst.accentColor,
              child: const Icon(Icons.logout),
            ),
          );
        },
      ),
    );
  }

  String _getFormattedBirthday(DateTime birthday) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(birthday);
  }

  void _onLogOutPressed() {
    _homeBloc.add(LogOut());
  }
}
