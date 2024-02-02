import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/cat_factory_model.dart';

Future<CatFact> getRandomCatFact() async {
  String url = 'https://cat-fact.herokuapp.com/facts/random';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return CatFact.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load cat fact');
  }
}
