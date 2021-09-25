import 'package:flutter/material.dart';

import 'ui/components/components.dart';
import 'ui/config/routes.dart';
import 'ui/pages/detail/detail_page.dart';
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
      initialRoute: AppRoutes.DETAIL_PAGE,
      routes: {
        AppRoutes.HOME_PAGE: (_) => const HomePage(),
        AppRoutes.DETAIL_PAGE: (_) => const DetailPage(),
      },
    );
  }
}
