
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../src/pages/pages.dart';
import '../src/theme/theme.dart';


void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: const MyApp()
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: const LauncherPage()
      // home: PinterestPage()
    );
  }
}