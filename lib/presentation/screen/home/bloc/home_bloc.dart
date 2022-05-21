import '../../../../model/repo/user_repository.dart';
import 'bloc.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc({required this.userRepository}) : super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LogOut) {
      yield* _mapLogOutToState();
    } else if (event is LoadData) {
      yield* _mapLoadDataToState();
    }
  }

  Stream<HomeState> _mapLoadDataToState() async* {
    yield HomeState.loading("Loading data...");
    try {
      var users = await userRepository.getAlUsers();
      yield HomeState.dataLoaded(users);
    } catch (_) {
      yield HomeState.failure("Cannot retrieve data");
    }
  }

  Stream<HomeState> _mapLogOutToState() async* {
    yield HomeState.loading("Logging out...");
    try {
      await userRepository.signOut();
      yield HomeState.logoutSuccess();
    } catch (_) {
      yield HomeState.failure("Cannot log out");
    }
  }
}
