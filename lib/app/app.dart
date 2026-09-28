import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/app_theme.dart';
import '../data/repositories/portfolio_repository.dart';
import '../data/repositories/theme_repository.dart';
import '../features/projects/bloc/projects_bloc.dart';
import '../features/projects/bloc/projects_event.dart';
import '../features/settings/bloc/theme_bloc.dart';
import '../features/settings/bloc/theme_event.dart';
import '../features/settings/bloc/theme_state.dart';
import 'routes.dart';

class PortfolioApp extends StatelessWidget {
  final ThemeRepository themeRepository;
  final PortfolioRepository portfolioRepository;

  const PortfolioApp({
    super.key,
    required this.themeRepository,
    required this.portfolioRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(themeRepository)..add(const LoadTheme()),
        ),
        BlocProvider<ProjectsBloc>(
          create: (_) =>
              ProjectsBloc(portfolioRepository)..add(const LoadProjects()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeMode currentThemeMode = ThemeMode.system;
          if (state is ThemeLoaded) {
            currentThemeMode = state.themeMode;
          }

          return MaterialApp(
            title: 'Suhaila Parvin | Flutter Developer Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: currentThemeMode,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AppRoutes.main,
          );
        },
      ),
    );
  }
}
