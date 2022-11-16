import 'dart:convert';

import 'package:api_example_flutter/app/modules/bible/models/book_model.dart';
import 'package:http/http.dart' as http;

class BibleRepository {
  static Future<List<BookModel>> getAllBooks() async {
    final uri = Uri.parse('https://www.abibliadigital.com.br/api/books');
    final result = await http.get(uri);
    print(result.body);
    final itemsMap = jsonDecode(result.body) as List;

    // final items = itemsMap.map((e) => BookModel.fromJson(e)).toList();
    List<BookModel> itemsList = [];
    for (var map in itemsMap) {
      final item = BookModel.fromJson(map);
      itemsList.add(item);
    }
    return itemsList;
  }
}
