import 'package:blabla/Term2/w9/data/repositories/artists/artist_repository.dart';
import 'package:blabla/Term2/w9/model/artists/artist.dart';
import 'package:blabla/Term2/w9/ui/utils/async_value.dart';
import 'package:flutter/material.dart';

class ArtistViewModel extends ChangeNotifier {
  ArtistRepository artistRepository;
  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    _init();
  }

  void _init() async {
    artistsValue = AsyncValue.loading();
    notifyListeners();
    try {
      List<Artist> artists = await artistRepository.fetchArtist();
      artistsValue = AsyncValue.success(artists);
      notifyListeners();
    } catch (error) {
      artistsValue = AsyncValue.error(error);
    }
    notifyListeners();
  }
}
