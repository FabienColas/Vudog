
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dogapp/assets/constants.dart' as Constants;
import 'package:flutter_dogapp/core/providers/screens_provider.dart';
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
      create: (_) => ScreensProvider(),
      child: Consumer<ScreensProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: PageView(
              children: provider.screens,
              controller: pageController,
              onPageChanged: (index) {
                provider.tab = index;
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              unselectedItemColor: Constants.BLUE,
              selectedItemColor: Constants.GREEN,
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
              currentIndex: provider.tab,
              onTap: (index) {
                // add transition animation between pages
                pageController.animateToPage(
                    index,
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: 500));
                provider.tab = index;
              },
            ),
          );
        },
      ),
    );
  }

}
