part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel result;
  const LoginSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class LoginFailed extends LoginState {
  final String message;
  const LoginFailed(this.message);
  @override
  List<Object> get props => [message];
}
