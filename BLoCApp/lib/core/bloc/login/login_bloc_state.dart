import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginInit extends LoginBlocState {}

class LoginSuccess extends LoginBlocState {
  final String success;

  const LoginSuccess({@required this.success});

  @override
  List<Object> get props => [success];
}

class LoginLoading extends LoginBlocState {}

class LoginStopLoading extends LoginBlocState {}

class LoginError extends LoginBlocState {
  final String error;

  const LoginError({@required this.error});

  @override
  List<Object> get props => [error];
}