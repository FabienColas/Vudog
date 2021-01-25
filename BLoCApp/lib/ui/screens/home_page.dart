
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dogapp/assets/constants.dart' as Constants;
import 'package:flutter_dogapp/ui/screens/breeds_page.dart';
import 'package:flutter_dogapp/ui/screens/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  int pageIndex = 0;
  List<Widget> screens = [LoginPage(), BreedsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: screens,
        controller: pageController,
        onPageChanged: (index) {
          pageIndex = index;
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
        currentIndex: pageIndex,
        onTap: (index) {
          // add transition animation between pages
          setState(() {
            pageController.animateToPage(
                index,
                curve: Curves.easeInOutCirc,
                duration: Duration(milliseconds: 500));
            pageIndex = index;
          });
        },
      ),
    );
  }

}
