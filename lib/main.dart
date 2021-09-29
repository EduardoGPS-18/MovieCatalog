import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'infra/http/http_adapter.dart';
import 'presentation/detail/detail.dart';
import 'presentation/presenters.dart';
import 'presentation/view_more/view_more.dart';
import 'ui/components/components.dart';
import 'ui/config/routes.dart';
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
        AppRoutes.HOME_PAGE: (_) => HomePage(StreamHomePresenter(HTTPAdapter(Client()))),
        AppRoutes.DETAIL_PAGE: (_) => DetailPage(StreamDetailPresenter(HTTPAdapter(Client()))),
        AppRoutes.VIEW_MORE_PAGE: (_) => ViewMorePage(StreamViewMorePresenter(HTTPAdapter(Client()))),
      },
    );
  }
}
