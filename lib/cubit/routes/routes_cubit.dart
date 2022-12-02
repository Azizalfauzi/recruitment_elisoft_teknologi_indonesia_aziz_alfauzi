import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'routes_state.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesInitial());
}
