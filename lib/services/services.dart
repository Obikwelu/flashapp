import 'dart:convert';

import 'package:flash_app/models/models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Flash?> getMovies() async {
    var url = Uri.parse(
        "https://api.tvmaze.com/singlesearch/shows?q=flash&embed=episodes");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = response.body;
      var decodedRes = jsonDecode(result);
      return Flash.fromJson(decodedRes);
    } else {
      return null;
    }
  }
}
