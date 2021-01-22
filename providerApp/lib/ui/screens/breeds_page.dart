//625f1f0d-b936-4a01-b7de-32e5fa8480de
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/models/dogs_model.dart';
import 'package:provider/provider.dart';

class BreedsPage extends StatefulWidget {
  BreedsPage({Key key}) : super(key: key);

  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {

  @override
  void initState() {
    super.initState();
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) => DogsModel(),
      child: Consumer<DogsModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: model.loading == true ? showLoading()
          : ListView(
            children: model.cards,
          ),
        );
        }
      ),
    );
  }
}
