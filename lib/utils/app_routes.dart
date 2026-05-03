import 'package:flutter/material.dart';
import '../views/home/home_page.dart';
import '../views/about/about_page.dart';
import '../views/services/services_page.dart';
import '../views/contact/contact_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String services = '/services';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        about: (context) => const AboutPage(),
        services: (context) => const ServicesPage(),
        contact: (context) => const ContactPage(),
      };
      
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case about:
      case services:
      case contact:
        Widget page;
        if (settings.name == about) page = const AboutPage();
        else if (settings.name == services) page = const ServicesPage();
        else page = const ContactPage();
        
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
