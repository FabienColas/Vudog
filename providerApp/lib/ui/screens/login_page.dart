
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/core/providers/login_provider.dart';
import 'package:flutter_dogapp/ui/widgets/drawing/curve.dart';
import 'package:flutter_dogapp/ui/widgets/login_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(context),
      child: Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              children: [
                // draw the up right shape
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: ShapeContainer(neg: true)
                ),
                LoginForm().buildForm(context, provider),
                // draw the down left shape
                Positioned(
                    top: MediaQuery.of(context).size.height * .6,
                    right: MediaQuery.of(context).size.width * .4,
                    child: ShapeContainer(neg: false)
                ),
              ],
            ),
          );
        },
      )
    );
  }
}