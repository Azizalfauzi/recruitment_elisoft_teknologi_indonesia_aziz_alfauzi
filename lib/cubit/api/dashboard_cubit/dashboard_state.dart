part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardGetSuccess extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardGetFailed extends DashboardState {
  @override
  List<Object> get props => [];
}
