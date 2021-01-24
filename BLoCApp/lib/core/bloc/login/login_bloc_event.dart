import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class LoginSubmit extends LoginBlocEvent {
  final String email;
  final String password;

  const LoginSubmit({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}