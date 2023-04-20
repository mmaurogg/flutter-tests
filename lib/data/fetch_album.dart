import 'dart:convert';

import 'package:testing/models/album_model.dart';
import 'package:http/http.dart' as http;

class FetchAlbum {
  Future<Album> getAlbum(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
