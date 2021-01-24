import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showSuccessDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.assignment_turned_in, color: Colors.greenAccent, size: 60,),
                  ],
                ),
                Text(message, style: TextStyle(fontSize: 18),)
              ]
          ),
        ),
        shape: CircleBorder(),
        actions: <Widget>[
        ],
      )
  );
}