part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardGetSuccess extends DashboardState {
  final List<Article> result;
  const DashboardGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class DashboardGetFailed extends DashboardState {
  final String message;
  const DashboardGetFailed(this.message);
  @override
  List<Object> get props => [message];
}
