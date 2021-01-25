
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/core/providers/screens_provider.dart';
import 'package:test/test.dart';

void main() {
  test('Test Screens class', () {
    final nav = ScreensProvider();

    // Change index to 1 && check screen
    nav.tab = 1;
    Widget screen = nav.screen;
    expect(nav.currentTab, 1);

    var result = screen == nav.screens[1] ? true :false;
    expect(result, true);

    // Change index to 0 && check screen
    nav.tab = 0;
    screen = nav.screen;
    expect(nav.currentTab, 0);

    result = screen == nav.screens[0] ? true :false;
    expect(result, true);
  });
}