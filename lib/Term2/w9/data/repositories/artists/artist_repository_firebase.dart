import 'package:blabla/Term2/w9/data/dtos/artist_dto.dart';
import 'package:blabla/Term2/w9/data/repositories/artists/artist_repository.dart';
import 'package:blabla/Term2/w9/model/artists/artist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistUri = Uri.https(
    'w9-practice-4a4bf-default-rtdb.firebaseio.com',
    '/artist.json',
  );

  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistUri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> artist =
          json.decode(response.body) as Map<String, dynamic>;
      return artist.entries.map((element) {
        String id = element.key;
        return ArtistDto.fromJson({
          'id': id,
          ...element.value,
        });
      }).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}