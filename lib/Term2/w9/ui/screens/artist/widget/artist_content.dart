import 'package:blabla/Term2/w9/model/artists/artist.dart';
import 'package:blabla/Term2/w9/ui/screens/artist/view_model/artist_view_model.dart';
import 'package:blabla/Term2/w9/ui/screens/artist/widget/artist_tile.dart';
import 'package:blabla/Term2/w9/ui/theme/theme.dart';
import 'package:blabla/Term2/w9/ui/utils/async_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistContent extends StatelessWidget {
  const ArtistContent({super.key});

  @override
  Widget build(BuildContext context) {
    ArtistViewModel mv = context.watch<ArtistViewModel>();
    AsyncValue<List<Artist>> asyncValue = mv.artistsValue;

    Widget content;

    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(
          child: Text(
            'error = ${asyncValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );
      case AsyncValueState.success:
        List<Artist> artists = mv.artistsValue.data!;
        content = ListView.builder(
          itemCount: artists.length,
          itemBuilder: (_, index) {
            return ArtistTile(artist: artists[index]);
          },
        );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Artist", style: AppTextStyles().heading),
          SizedBox(height: 50),

          Expanded(child: content),
        ],
      ),
    );
  }
}
