import 'package:flutter/cupertino.dart';
import 'package:flutter_vudog/ui/screens/breeds_page.dart';
import 'package:flutter_vudog/ui/screens/login_page.dart';

// class that handle BottomNavigationBar logic
class ScreensModel extends ChangeNotifier {
  int currentTab = 0;
  List<Widget> screens = [
    LoginPage(),
    BreedsPage()
  ];

  get tab => this.currentTab;
  get screen => screens[this.currentTab];
  set tab(int index) {
    this.currentTab = index;
    notifyListeners();
  }
}