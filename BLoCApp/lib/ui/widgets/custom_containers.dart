import 'package:flutter/material.dart';

// build Container with symmetric margin
Widget customContainer(Widget child, bool horizontal, bool vertical) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: horizontal==true?10:0, vertical: vertical==true?10:0),
    child: child,
  );
}

// build icon next to element
Widget customIconContainer(Widget child,) {
  return Container(
    margin: EdgeInsets.only(left: 2),
    child: child,
  );
}