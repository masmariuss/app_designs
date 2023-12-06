
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  bool _darkTheme   = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme    => _darkTheme;
  bool get customTheme  => _customTheme;
  ThemeData get currentTheme => _currentTheme;
  Color get indicatorColor => currentTheme.indicatorColor;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
      
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;
      
      case 3:
        _darkTheme = false;
        _customTheme = true;
      break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();

    }
  } 

  set darkTheme(bool value) {

    _darkTheme    = value;
    _customTheme  = false;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {

    _darkTheme    = false;
    _customTheme  = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          indicatorColor: const Color(0xff48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202B),
          canvasColor: const Color(0xff16202B),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white
          // textTheme.bodyLarge?.color: 
            )
          ), 
          colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: const Color(0xff48A0EB)
          )
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

}

