
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dogapp/core/bloc/login/login_bloc.dart';
import 'package:flutter_dogapp/core/bloc/login/login_bloc_state.dart';
import 'package:flutter_dogapp/ui/widgets/drawing/curve.dart';
import 'package:flutter_dogapp/ui/widgets/login_form.dart';
import 'package:flutter_dogapp/ui/widgets/errors_dialog.dart';
import 'package:flutter_dogapp/ui/widgets/success_dialog.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // ignore: close_sinks
  LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginBlocState>(
      cubit: loginBloc,
        builder: (context, state) {
        if (state is LoginError) {
          SchedulerBinding.instance.addPostFrameCallback((_) =>
            showErrorDialog(context, state.error));
        }
        if (state is LoginSuccess) {
          SchedulerBinding.instance.addPostFrameCallback((_) =>
              showSuccessDialog(context, state.success));
        }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                // draw the up right shape
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: ShapeContainer(neg: true)
                ),
                LoginForm().buildForm(context, loginBloc, state),
                // draw the down left shape
                Positioned(
                    top: MediaQuery.of(context).size.height * .6,
                    right: MediaQuery.of(context).size.width * .4,
                    child: ShapeContainer(neg: false)
                ),
              ],
            ),
          );
        }
    );
  }
}
/*

 */