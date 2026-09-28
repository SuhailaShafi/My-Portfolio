import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/app/app.dart';
import 'package:my_portfolio/data/local/hive_service.dart';
import 'package:my_portfolio/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio/data/repositories/theme_repository.dart';

void main() {
  testWidgets('PortfolioApp loads main profile header', (
    WidgetTester tester,
  ) async {
    final hiveService = HiveService();
    final themeRepo = ThemeRepository(hiveService);
    final portfolioRepo = PortfolioRepository(hiveService);

    await tester.pumpWidget(
      PortfolioApp(
        themeRepository: themeRepo,
        portfolioRepository: portfolioRepo,
      ),
    );

    expect(find.text('Suhaila Parvin'), findsWidgets);
  });
}
