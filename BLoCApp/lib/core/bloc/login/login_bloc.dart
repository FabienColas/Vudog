
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_dogapp/extensions/string_extensions.dart';
import 'package:flutter_dogapp/core/bloc/login/login_bloc_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_dogapp/core/bloc/login/login_bloc_state.dart';



class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(null);

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event,) async* {
    if (event is LoginSubmit) {
      var email = event.email;
      var password = event.password;
      yield LoginLoading();
      try {
        Dio dio = Dio();
        String url = 'https://reqres.in/api/login';
        final response = await dio.post(url, data: {
          'email': '$email',
          'password': '$password'
        },
        );
        if (response.statusCode == 200) {
          yield LoginStopLoading();
          print(response.data);
          yield LoginSuccess(success: 'Authentication complete');
        }
      } catch (error) {
        if (error is DioError) {
          String errorMessage = error.response.data['error'];
          errorMessage = errorMessage.capitalize();
          yield LoginError(error: errorMessage);
        }
      }
    }
  }
}