
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dogapp/core/models/screens_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScreensModel(),
      child: Consumer<ScreensModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: PageView(
              children: model.screens,
              controller: pageController,
              onPageChanged: (index) {
                model.tab = index;
              },
            ),
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
                pageController.animateToPage(
                    index,
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: 500));
                model.tab = index;
              },
            ),
          );
        },
      ),
    );
  }

}
