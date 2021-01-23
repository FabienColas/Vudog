
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/widgets/errors_dialog.dart';
import 'package:flutter_dogapp/ui/extensions/string_extensions.dart';

class LoginModel extends ChangeNotifier {
  final BuildContext context;
  String errorMessage;
  bool errors;
  bool loading = false;
  bool success = false;

  LoginModel(this.context);

  Future<void> loginRequest(String email, String password) async {
    isLoading(true);
    try {
      Dio dio = Dio();
      String url = 'https://reqres.in/api/login';
      final response = await dio.post(url, data: {
        "email": "$email",
        "password": "$password"
        },
      );
      if (response.statusCode == 200) {
        isLoading(false);
        success = true;
        print(response.data);
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      success = false;
      errors = true;
      if (e is DioError) {
        errorMessage = e.response.data['error'];
        errorMessage = errorMessage.capitalize();
        showErrorDialog(context, errorMessage, 'Oh oh...');
      }
      print(errorMessage);
      notifyListeners();
    }
  }

  void isLoading(bool state) {
    loading = state;
    notifyListeners();
  }
}