import 'package:flutter/material.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 500;
        final stats = [
          _StatData(
            icon: Icons.app_shortcut_rounded,
            title: '4+ Projects',
            subtitle: 'E-commerce, Delivery, Health',
          ),
          _StatData(
            icon: Icons.devices_rounded,
            title: 'Cross-Platform',
            subtitle: 'iOS & Android Production Apps',
          ),
          _StatData(
            icon: Icons.architecture_rounded,
            title: 'Clean Architecture',
            subtitle: 'BLoC & Local Storage (Hive)',
          ),
        ];

        if (isWide) {
          return Row(
            children: stats
                .map(
                  (stat) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: _StatCard(data: stat),
                    ),
                  ),
                )
                .toList(),
          );
        }

        return Column(
          children: stats
              .map(
                (stat) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _StatCard(data: stat),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _StatData {
  final IconData icon;
  final String title;
  final String subtitle;

  _StatData({required this.icon, required this.title, required this.subtitle});
}

class _StatCard extends StatelessWidget {
  final _StatData data;

  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                data.icon,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.65,
                      ),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
