import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/usecases/usecases.dart';
import 'infra/http/http.dart';
import 'presentation/presenters.dart';
import 'ui/components/theme/theme.dart';
import 'ui/config/config.dart';
import 'ui/config/film_api.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nerdflix",
      theme: AppTheme.darkThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME_PAGE,
      routes: {
        AppRoutes.HOME_PAGE: (_) => HomePage(
              GetxHomePresenter(
                loadReleasesFilm: RemoteLoadReleasesFilms(
                  client: HTTPAdapter(Client()),
                  url: FilmApi.RELEASES_FILM,
                ),
                loadFilmByCategory: RemoteLoadFilmByCategory(
                  client: HTTPAdapter(Client()),
                  url: FilmApi.apiPathToSearchFilmsByCategory,
                ),
              ),
            ),
        AppRoutes.DETAIL_PAGE: (_) => DetailPage(
              GetxDetailPresenter(
                RemoteLoadFilmInformation(
                  client: HTTPAdapter(
                    Client(),
                  ),
                  url: FilmApi.apiPathToSearchFilmInformation,
                ),
              ),
            ),
        AppRoutes.VIEW_MORE_PAGE: (_) => ViewMorePage(
              GetxViewMorePresenter(
                RemoteLoadFilmByCategory(
                  client: HTTPAdapter(
                    Client(),
                  ),
                  url: FilmApi.apiPathToSearchFilmsByCategory,
                ),
              ),
            ),
      },
    );
  }
}
