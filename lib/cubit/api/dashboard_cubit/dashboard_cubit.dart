import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/model/model.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/services/services.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  void getDashboardData() async {
    try {
      emit(DashboardLoading());
      var duration = const Duration(milliseconds: 1500);
      Timer(duration, () async {
        List<Article> result = await DashboardServices.getDashboardData();
        emit(DashboardGetSuccess(result));
      });
    } catch (e) {
      emit(DashboardGetFailed(e.toString()));
    }
  }
}
