import 'package:get/get.dart';

import '../drinks_model.dart';

class DrinksProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Drinks.fromJson(map);
      if (map is List) return map.map((item) => Drinks.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Drinks?> getDrinks(int id) async {
    final response = await get('drinks/$id');
    return response.body;
  }

  Future<Response<Drinks>> postDrinks(Drinks drinks) async =>
      await post('drinks', drinks);
  Future<Response> deleteDrinks(int id) async => await delete('drinks/$id');
}
