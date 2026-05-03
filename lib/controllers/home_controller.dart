import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  late AnimationController heroAnimController;
  late AnimationController floatAnimController;
  late AnimationController particleAnimController;
  late Animation<double> heroFade;
  late Animation<Offset> heroSlide;
  late Animation<double> floatAnim;

  int _currentServiceIndex = 0;
  bool _isLoaded = false;

  int get currentServiceIndex => _currentServiceIndex;
  bool get isLoaded => _isLoaded;

  void initAnimations(TickerProvider vsync) {
    heroAnimController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    floatAnimController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    particleAnimController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 8),
    )..repeat();

    heroFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: heroAnimController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: heroAnimController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    floatAnim = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: floatAnimController, curve: Curves.easeInOut),
    );
    
    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    heroAnimController.forward();
    _isLoaded = true;
    notifyListeners();
  }

  @override
  void dispose() {
    heroAnimController.dispose();
    floatAnimController.dispose();
    particleAnimController.dispose();
    super.dispose();
  }
}
