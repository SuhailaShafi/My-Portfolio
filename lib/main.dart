import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'data/local/hive_service.dart';
import 'data/repositories/portfolio_repository.dart';
import 'data/repositories/theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive Service for Local Storage & Theme Persistence.
  // hive_flutter handles web (IndexedDB) automatically when kIsWeb is true —
  // path_provider is only invoked on native platforms.
  final hiveService = HiveService();
  try {
    await hiveService.init();
  } catch (e) {
    debugPrint('Hive Initialization Error: $e');
  }

  // Initialize Repositories
  final themeRepository = ThemeRepository(hiveService);
  final portfolioRepository = PortfolioRepository(hiveService);

  runApp(
    PortfolioApp(
      themeRepository: themeRepository,
      portfolioRepository: portfolioRepository,
    ),
  );
}
