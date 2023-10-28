import 'dart:convert';

import 'package:covidstat/Models/worlddata.dart';
import 'package:covidstat/services/url.dart';
import 'package:http/http.dart' as http;

class AllData {
  Future<WorldData> getdata() async {
    try {
      http.Response response = await http.get(Uri.parse(url.mainurl));

      if (response.statusCode == 200) {
        print('statuscode successfull');
        var data = jsonDecode(response.body);

        print('api body:$data');
        return WorldData.fromJson(data);
      } else {
        throw Exception(
            'HTTP request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  Future<List<dynamic>> countrydata() async {
    try {
      http.Response response = await http.get(Uri.parse(url.countryurl));
      if (response.statusCode == 200) {
        print('statuscode successfull');
        List<dynamic> data = jsonDecode(response.body);

        print('api body:$data');
        return data;
      } else {
        throw Exception(
            'HTTP request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('something went wrong: $e');
    }
  }
}
