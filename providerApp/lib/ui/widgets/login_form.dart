import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/assets/constants.dart' as Constants;
import 'package:flutter_dogapp/core/models/loginModel.dart';
import 'package:flutter_dogapp/ui/widgets/custom_containers.dart';

class LoginForm {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget buildForm(BuildContext context, LoginModel model) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Vudog', style: TextStyle(fontSize: 80, fontFamily: 'Berkah'),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Card(
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customContainer(Text(Constants.USERNAME,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ), true, true),
                      customIconContainer(Icon(Icons.person),
                      )
                    ],
                  ),
                  customContainer(TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Constants.BLUE, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: Constants.HINT_EMAIL,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ), true, false
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(Constants.PASSWORD, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                      Container(
                        margin: EdgeInsets.only(left: 2),
                        child: Icon(Icons.lock),
                      )
                    ],
                  ),
                  customContainer(TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constants.BLUE, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: Constants.HINT_PASSWORD,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    true,
                    true
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: model.loading == true ? CircularProgressIndicator() : MaterialButton(
                      elevation: 5,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // email ok eve.holt@reqres.in
                          model.loginRequest(_emailController.text, _passwordController.text);
                        }
                      },
                      color: model.success == true ? Constants.GREEN : Constants.BLUE,
                      child: Icon(
                        Icons.pets,
                        size: 40,
                      ),
                      padding: EdgeInsets.all(12),
                      shape: CircleBorder(),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}