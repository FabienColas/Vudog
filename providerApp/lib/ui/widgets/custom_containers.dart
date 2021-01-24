import 'package:flutter/material.dart';

Widget customContainer(Widget child, bool horizontal, bool vertical) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: horizontal==true?10:0, vertical: vertical==true?10:0),
    child: child,
  );
}

Widget customIconContainer(Widget child,) {
  return Container(
    margin: EdgeInsets.only(left: 2),
    child: child,
  );
}