import 'package:flutter/material.dart';
import 'package:unsplash_test_app/ui/full_image_screen.dart';
import 'package:unsplash_test_app/ui/images_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'images':
        return MaterialPageRoute(
          builder: (_) => ImagesScreen(),
        );
      case 'fullImage':
        return MaterialPageRoute(
          builder: (_) => FullImageScreen(settings.arguments),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
