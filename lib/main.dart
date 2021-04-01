import 'package:flutter/material.dart';
import 'app/views/home.view.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: HomeView());
  }
}
