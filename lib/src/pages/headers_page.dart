
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/headers.dart';
import '../theme/theme.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {

    final indicatorColor = Provider.of<ThemeChanger>(context).indicatorColor;

    return Scaffold(
      body: HeaderWave(color: indicatorColor)
    );
  }
}