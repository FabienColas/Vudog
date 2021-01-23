import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showErrorDialog(BuildContext context, String message, String type) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        //title: Text(type, style: TextStyle(fontWeight: FontWeight.bold),),
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.redAccent, size: 60,),
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