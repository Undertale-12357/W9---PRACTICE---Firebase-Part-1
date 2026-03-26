import 'package:blabla/Term2/w9/model/artists/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtist();
}
