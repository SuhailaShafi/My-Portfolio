import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/theme_repository.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeBloc(this._themeRepository) : super(const ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    emit(const ThemeLoading());
    try {
      final savedMode = _themeRepository.getSavedThemeMode();
      emit(ThemeLoaded(savedMode));
    } catch (e) {
      emit(ThemeError('Failed to load theme preference: $e'));
    }
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    emit(const ThemeLoading());
    try {
      await _themeRepository.saveThemeMode(event.themeMode);
      emit(ThemeLoaded(event.themeMode));
    } catch (e) {
      emit(ThemeError('Failed to save theme preference: $e'));
    }
  }
}
