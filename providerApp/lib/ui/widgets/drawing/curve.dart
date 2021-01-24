import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vudog/assets/constants.dart' as Constants;
import 'custom_clip.dart';

class ShapeContainer extends StatelessWidget {
  const ShapeContainer({Key key, this.neg}) : super(key: key);

  final bool neg;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: neg == true ? -pi / 5 : pi / 1.3,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height *.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Constants.BLUE,Constants.BLUE]
                  )
              ),
            ),
          ),
        )
    );
  }
}