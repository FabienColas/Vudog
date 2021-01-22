import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dogapp/ui/widgets/dog_card.dart';

class DogsModel extends ChangeNotifier {

  bool loading = false;
  List<DogCard> cards = [];

  DogsModel(){
    isLoading(true);
    getBreeds();
  }
  
  Future<void> getBreeds() async {
    Dio dio = new Dio();
    String url = 'https://api.thedogapi.com/v1/breeds';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['x-api-key'] = '625f1f0d-b936-4a01-b7de-32e5fa8480de';
    final response = await dio.get(url, queryParameters:{"page": 1, 'limit': 15});
    if (response.statusCode == 200) {
      isLoading(false);
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
    } else {
      print('Error');
    }
  }

  void isLoading(bool state) {
    loading = state;
    notifyListeners();
  }
}