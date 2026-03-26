import 'package:blabla/Term2/W6/data/repositories/songs/song_repository.dart';
import 'package:blabla/Term2/w7/data/repositories/settings/app_settings_repository_mock.dart';
import 'package:blabla/Term2/w7/ui/states/player_state.dart';
import 'package:blabla/Term2/w7/ui/states/settings_state.dart';
import 'package:blabla/Term2/w9/data/repositories/songs/song_repository_firebase.dart';
import 'package:provider/provider.dart';


/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryFirebase()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
  ];
}
