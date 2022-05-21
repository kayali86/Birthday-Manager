import 'package:rxdart/rxdart.dart';

import '../../../../model/repo/user_repository.dart';
import 'bloc.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc({required this.userRepository}) : super(HomeState.empty());

  @override
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
      Stream<HomeEvent> events,
      TransitionFunction<HomeEvent, HomeState> transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! LogOut);
    });

    final debounceStream = events.where((event) {
      return (event is LogOut);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LogOut) {
      yield* _mapLogOutToState();
    }
  }

  Stream<HomeState> _mapLogOutToState() async* {
    yield HomeState.loading();
    try {
      await userRepository.signOut();
      yield HomeState.success();
    } catch (_) {
      yield HomeState.failure();
    }
  }
}
