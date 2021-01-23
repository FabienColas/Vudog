
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/models/loginModel.dart';
import 'package:flutter_dogapp/ui/widgets/drawing/curve.dart';
import 'package:flutter_dogapp/ui/widgets/errors_dialog.dart';
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
      create: (_) => LoginModel(context),
      child: Consumer<LoginModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: ShapeContainer(neg: true)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('DogApp', style: TextStyle(fontSize: 80, fontFamily: 'Berkah'),),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Icon(Icons.person),
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff3599cb), width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                    ),
                                    hintText: 'dog@gmail.com',
                                  ),
                                )
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Icon(Icons.lock),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff3599cb), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                  ),
                                  hintText: '*******',
                                ),
                              ),
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
                                onPressed: () {
                                  model.loginRequest("eve.holt@reqres.i", "cityslick");
                                },
                                color: model.success == true ? Color(0xff31d287) : Color(0xff3599cb),
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