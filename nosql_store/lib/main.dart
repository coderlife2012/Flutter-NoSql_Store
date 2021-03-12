import 'package:flutter/material.dart';
import 'package:nosql_store/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildAppTheme(),
      home: HomePage(),
    );
  }

  ThemeData buildAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: buildAppTextTheme(base.textTheme),
      primaryTextTheme: buildAppTextTheme(base.primaryTextTheme),
      accentTextTheme: buildAppTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.black),
      errorColor: Colors.red,
    );
  }

  TextTheme buildAppTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5.copyWith(fontWeight: FontWeight.w500),
          headline6: base.headline6.copyWith(fontWeight: FontWeight.w300),
        )
        .apply(
          fontFamily: 'Ubuntu',
          displayColor: Colors.black,
          bodyColor: Colors.black,
        );
  }

  IconThemeData buildAppIconTheme(IconThemeData base) {
    return base.copyWith(color: Colors.black);
  }
}
