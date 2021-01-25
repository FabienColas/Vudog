
import 'package:dio/dio.dart';
import 'package:flutter_dogapp/ui/widgets/dog_card.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';

void main() {
  test('Test DioAdapter and build correct dogCard', () async {
    DogCard dogCard;
    final dio = Dio();
    final dioAdapter = DioAdapter();

    dio.httpClientAdapter = dioAdapter;

    const path = 'https://reqres.in/api/login';

    // Request building
    dioAdapter.onGet(path).reply(200, {
        "name": "Australian Shepherd",
        "origin": "Australia",
        "image": "https://test.png",
        "life_span": "13",
        "weight": "20",
        "height": "30",
        "temperament": "calm"
    });

    // Receive request response && build Card
    final getResponse = await dio.get(path);
    dogCard = DogCard(
      name: getResponse.data['name'],
      origin: getResponse.data['origin'],
      image: null,
      lifespan: getResponse.data['life_span'],
      weightMetric: getResponse.data['weight'],
      heightMetric: getResponse.data['height'],
      temperament: getResponse.data['temperament'],
    );

    // Verify information
    expect(dogCard.name, 'Australian Shepherd');
    expect(dogCard.origin, 'Australia');
    expect(dogCard.lifespan, '13');
    expect(dogCard.weightMetric, '20');
    expect(dogCard.heightMetric, '30');
    expect(dogCard.temperament, 'calm');
  });
}