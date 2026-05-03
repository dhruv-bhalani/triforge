import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isMenuOpen = false;

  int get currentIndex => _currentIndex;
  bool get isMenuOpen => _isMenuOpen;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleMenu() {
    _isMenuOpen = !_isMenuOpen;
    notifyListeners();
  }

  void closeMenu() {
    _isMenuOpen = false;
    notifyListeners();
  }
}
