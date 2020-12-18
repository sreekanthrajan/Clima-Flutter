import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const apiKey = 'a154d9bb5c96bbe761291af118f12946';
const weatherURL = 'http://api.openweathermap.org/data/2.5/weather';

class NetworkingHelper {
  Future<dynamic> getCityWeather({@required String cityName}) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = '$weatherURL?q=$cityName&appid=$apiKey&units=imperial';
    var jsonResponse;
    // Await the http get response, then decode the json-formatted response.
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }

  Future<dynamic> getLocationWeather(
      {@required double lat, @required double long}) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = '$weatherURL?lat=$lat&lon=$long&appid=$apiKey&units=imperial';
    var jsonResponse;
    // Await the http get response, then decode the json-formatted response.
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }
}
