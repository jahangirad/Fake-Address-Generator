import 'dart:convert';
import 'package:get/get.dart';
import '../data_model/get_data_model.dart';
import 'package:http/http.dart' as http;

class AllData extends GetxController {
  RxList<GetRendomData> randomData = <GetRendomData>[].obs;

  Future<RxList<GetRendomData>> getApiData(String selectedCountryShortName, String selectedGender) async {
    final response = await http.get(
        Uri.parse('https://randomuser.me/api/1.4/?nat=$selectedCountryShortName&gender=$selectedGender'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      // Assuming 'results' contains the list of user data
      List<dynamic> results = data['results'];

      // Clearing previous data
      randomData.clear();

      // Adding new data
      for (var item in results) {
        randomData.add(GetRendomData.fromJson(item));
      }

      return randomData;
    } else {
      return randomData;
    }
  }
}
