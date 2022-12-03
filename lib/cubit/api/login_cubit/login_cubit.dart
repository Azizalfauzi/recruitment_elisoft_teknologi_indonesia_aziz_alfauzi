import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/model/model.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/services/services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void loginGlobal(String email, String password) async {
    try {
      emit(LoginLoading());
      LoginModel result = await AuthServices.loginApp(email, password);
      emit(LoginSuccess(result));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }

  void logoutGlobal() {
    AuthServices.signOut();
  }
}
