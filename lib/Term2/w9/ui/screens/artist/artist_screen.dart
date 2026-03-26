import 'package:blabla/Term2/w9/data/repositories/artists/artist_repository.dart';
import 'package:blabla/Term2/w9/ui/screens/artist/view_model/artist_view_model.dart';
import 'package:blabla/Term2/w9/ui/screens/artist/widget/artist_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: ArtistContent(),
      create: (context) {
        return ArtistViewModel(
          artistRepository: context.read<ArtistRepository>(),
        );
      },
    );
  }
}
