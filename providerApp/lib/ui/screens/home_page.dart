
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/models/screens_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScreensModel(),
      child: Consumer<ScreensModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: model.screen,
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color(0xff31d287),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.login),
                  label: 'Login'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.view_list_rounded),
                    label: 'Breeds'
                )
              ],
              currentIndex: model.tab,
              onTap: (index) {
                model.tab = index;
              },
            ),
          );
        },
      ),
    );
  }
}
