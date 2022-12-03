import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_state.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesLogin());
  Stream<RoutesState> mapEventToState(RoutesState state) async* {
    if (state is RoutesLogin) {
      emit(RoutesLogin());
    } else if (state is RoutesDashboard) {
      emit(RoutesDashboard());
    } else {
      emit(RoutesLogin());
    }
  }
}
