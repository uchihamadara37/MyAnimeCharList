import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class ApiService {
  static const baseUrl = 'https://dattebayo-api.onrender.com';

  static Future<List<Character>> fetchCharacters(String group) async {
    final response = await http.get(Uri.parse('$baseUrl/$group'));

    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List characters = data[group];
      return characters.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
