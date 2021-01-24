import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vudog/ui/widgets/dog_card.dart';
import 'package:flutter_vudog/ui/widgets/errors_dialog.dart';

class DogsModel extends ChangeNotifier {

  BuildContext context;
  bool loading = false;
  bool errors = false;
  bool noMoreData = false;
  int currentPage = 0;
  List<DogCard> cards = [];

  DogsModel(BuildContext context){
    this.context = context;
    isLoading(true);
    getBreeds();
  }

  Future<void> getBreeds() async {
    try {
      Dio dio = new Dio();
      String url = 'https://api.thedogapi.com/v1/breeds';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['x-api-key'] = '625f1f0d-b936-4a01-b7de-32e5fa8480de';
      final response = await dio.get(
          url, queryParameters: {'page': currentPage, 'limit': 30});
      if (response.statusCode == 200) {
        var result = response.data;
        result.forEach((element) {
          print(element);
          cards.add(DogCard(
              name: element['name'],
              image: element['image']['url'],
              origin: element['origin'],
              lifespan: element['life_span'],
              weightMetric: element['weight']['metric'],
              heightMetric: element['height']['metric'],
              temperament: element['temperament']));
        });
        currentPage++;
        isLoading(false);
      }
    } catch (e) {
      showErrorDialog(context, "Something went wrong");
    }
  }

  Future<void> getMoreBreeds() async {
    try {
      Dio dio = new Dio();
      String url = 'https://api.thedogapi.com/v1/breeds';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['x-api-key'] = '625f1f0d-b936-4a01-b7de-32e5fa8480de';
      final response = await dio.get(
          url, queryParameters: {'page': currentPage, 'limit': 30});
      if (response.statusCode == 200) {
        var result = response.data;
        if (response.data.length == 0) {
          noMoreData = true;
          notifyListeners();
          return;
        }
        result.forEach((element) {
          print(element);
          cards.add(DogCard(
              name: element['name'],
              image: element['image']['url'],
              origin: element['origin'],
              lifespan: element['life_span'],
              weightMetric: element['weight']['metric'],
              heightMetric: element['height']['metric'],
              temperament: element['temperament']));
        });
        currentPage++;
        isLoading(false);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.message);
      }
    }
  }

  void isLoading(bool state) {
    loading = state;
    notifyListeners();
  }
}