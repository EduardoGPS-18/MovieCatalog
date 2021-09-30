import 'package:flutter/material.dart';

import 'main/factories/pages/pages.dart';
import 'main/factories/pages/view_more/view_more_page_factory.dart';
import 'ui/components/theme/theme.dart';
import 'ui/config/config.dart';

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
        AppRoutes.HOME_PAGE: (_) => makeHomePage(),
        AppRoutes.DETAIL_PAGE: (_) => makeDetailPage(),
        AppRoutes.VIEW_MORE_PAGE: (_) => makeViewMorePage(),
      },
    );
  }
}
