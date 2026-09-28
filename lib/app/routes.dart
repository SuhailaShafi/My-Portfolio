import 'package:flutter/material.dart';
import '../data/models/project_model.dart';
import '../features/main_navigation/pages/main_screen.dart';
import '../features/projects/pages/project_detail_page.dart';
import '../features/settings/pages/settings_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String main = '/';
  static const String settings = '/settings';
  static const String projectDetail = '/project-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case projectDetail:
        final project = settings.arguments as ProjectModel;
        return MaterialPageRoute(
          builder: (_) => ProjectDetailPage(project: project),
        );
      default:
        return MaterialPageRoute(builder: (_) => const MainScreen());
    }
  }
}
