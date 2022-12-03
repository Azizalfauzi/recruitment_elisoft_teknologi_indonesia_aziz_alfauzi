import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/cubit/api/dashboard_cubit/dashboard_cubit.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/cubit/api/login_cubit/login_cubit.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/shared/shared.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:recruitment_elisoft_teknologi_indonesia_aziz_alfauzi/views/widget/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../cubit/routes/routes_cubit.dart';

part 'dashboard_pages.dart';
part 'login_pages.dart';
part 'wrapper_pages.dart';