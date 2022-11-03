import 'package:http/http.dart' as http;
import 'dart:convert';

class BreedApi {
  Future<dynamic> getBreed(q) async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds/search?q=$q'),
      headers: {
        "Accept": "application/json, text/plain, */*",
        "x-api-key":
            "live_ghnY2VrF9DWXE6J10XyimJ4uiTErBmvuh3owWue64CculG2M5IqSstRd834n3cal",
      },
    );

    var returnData = {};

    if (response.statusCode == 200) {
      List temp = json.decode(response.body);

      List<Map<String, dynamic>> breedList = [];
      temp.forEach((element) {
        breedList.add(element);
      });

      returnData['statusCode'] = 200;
      returnData['breed'] = breedList;

      return returnData;
    } else {
      returnData['statusCode'] = response.statusCode;
      returnData['breed'] = [];
      return returnData;
    }
  }
}
