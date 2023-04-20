import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testing/data/fetch_album.dart';
import 'package:testing/models/album_model.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'fetch_album_test.mocks.dart';

//class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
//@GenerateNiceMocks([MockSpec<http.Client>()])
Future<void> main() async {
  group(
    "Http package",
    () {
      test('fetch album (get)', () async {
        final client = MockClient();
        final data = FetchAlbum();

        when(client.get(
                Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
            .thenAnswer((_) async =>
                http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

        expect(await data.getAlbum(client), isA<Album>());

        await data.getAlbum(client);

        verify(client
            .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')));
      });
    },
  );
}
