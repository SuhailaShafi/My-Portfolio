import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';
import '../bloc/theme_event.dart';
import '../bloc/theme_state.dart';
import '../../../shared/widgets/section_header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Appearance Theme',
              subtitle: 'Select your preferred visual theme mode',
            ),
            const SizedBox(height: 8),

            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                ThemeMode currentMode = ThemeMode.system;
                if (state is ThemeLoaded) {
                  currentMode = state.themeMode;
                }

                return Card(
                  child: Column(
                    children: [
                      _ThemeOptionTile(
                        title: 'System Default',
                        subtitle: 'Follow device system color theme',
                        icon: Icons.brightness_auto_rounded,
                        mode: ThemeMode.system,
                        selectedMode: currentMode,
                        onSelect: (mode) {
                          context.read<ThemeBloc>().add(ThemeChanged(mode));
                        },
                      ),
                      const Divider(height: 1),
                      _ThemeOptionTile(
                        title: 'Light Theme',
                        subtitle:
                            'Clean light background with soft slate accents',
                        icon: Icons.light_mode_rounded,
                        mode: ThemeMode.light,
                        selectedMode: currentMode,
                        onSelect: (mode) {
                          context.read<ThemeBloc>().add(ThemeChanged(mode));
                        },
                      ),
                      const Divider(height: 1),
                      _ThemeOptionTile(
                        title: 'Dark Theme',
                        subtitle: 'Sleek deep navy theme for low light',
                        icon: Icons.dark_mode_rounded,
                        mode: ThemeMode.dark,
                        selectedMode: currentMode,
                        onSelect: (mode) {
                          context.read<ThemeBloc>().add(ThemeChanged(mode));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 28),

            const SectionHeader(
              title: 'Architecture & Technical Info',
              subtitle: 'Built with Flutter best practices',
            ),
            const SizedBox(height: 8),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const _InfoRow(label: 'Framework', value: 'Flutter & Dart'),
                    const Divider(height: 16),
                    const _InfoRow(
                      label: 'State Management',
                      value: 'flutter_bloc',
                    ),
                    const Divider(height: 16),
                    const _InfoRow(
                      label: 'Local Database',
                      value: 'Hive (NoSQL)',
                    ),
                    const Divider(height: 16),
                    const _InfoRow(
                      label: 'Architecture',
                      value: 'Clean Architecture',
                    ),
                    const Divider(height: 16),
                    _InfoRow(
                      label: 'Theme Persistence',
                      value: 'Hive Box (Saved local preference)',
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode mode;
  final ThemeMode selectedMode;
  final ValueChanged<ThemeMode> onSelect;

  const _ThemeOptionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.mode,
    required this.selectedMode,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedMode == mode;
    final primaryColor = theme.colorScheme.primary;

    return ListTile(
      onTap: () => onSelect(mode),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withValues(alpha: 0.15)
              : theme.colorScheme.onSurface.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? primaryColor : theme.colorScheme.onSurface,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected ? primaryColor : theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle_rounded, color: primaryColor)
          : Icon(
              Icons.circle_outlined,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _InfoRow({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
