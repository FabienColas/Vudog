
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dogapp/core/bloc/dogs/dogs_bloc_event.dart';
import 'package:flutter_dogapp/core/bloc/dogs/dogs_bloc_state.dart';
import 'package:flutter_dogapp/ui/widgets/dog_card.dart';
import 'package:flutter_dogapp/extensions/string_extensions.dart';

class DogsBloc extends Bloc<DogsBlocEvent, DogsBlocState> {
  DogsBloc() : super(null);

  static int currentPage = 0;
  List<DogCard> cards = [];


  @override
  Stream<DogsBlocState> mapEventToState(DogsBlocEvent event,) async* {
    if (event is DogsLoadBreeds || event is DogsLoadMoreBreeds) {
      try {
        if (event is DogsLoadBreeds) {
          yield DogsLoading();
        }
        Dio dio = new Dio();
        String url = 'https://api.thedogapi.com/v1/breeds';
        dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers['x-api-key'] = '625f1f0d-b936-4a01-b7de-32e5fa8480de';
        final response = await dio.get(
            url, queryParameters: {'page': currentPage, 'limit': 30});
        if (response.statusCode == 200) {
          var result = response.data;
          print(result);
          if (response.data.length == 0) {
            yield DogsNoMoreData();
            return;
          }
          result.forEach((element) {
            cards.add(DogCard(
                name: element['name'] ?? 'unknown',
                image: element['image']['url'] ?? 'unknown',
                origin: element['origin'] ?? 'unknown',
                lifespan: element['life_span'] ?? 'unknown',
                weightMetric: element['weight']['metric'] ?? 'unknown',
                heightMetric: element['height']['metric'] ?? 'unknown',
                temperament: element['temperament'] ?? 'unknown'));
          });
          currentPage++;
          yield DogsStopLoading();
          yield DogsLoaded();
        } else {
          print('error');
        }
      } catch (error) {
        if (error is DioError) {
          String errorMessage = error.response.data['error'];
          errorMessage = errorMessage.capitalize();
          yield DogsError(error: errorMessage);
        }
      }
    }
  }
}