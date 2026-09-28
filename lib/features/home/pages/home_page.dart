import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/url_launcher_service.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/quick_stats_section.dart';

class HomePage extends StatelessWidget {
  final Function(int) onNavigateToTab;

  const HomePage({super.key, required this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Profile Avatar Hero
            const ProfileAvatar(radius: 64),
            const SizedBox(height: 20),

            // Developer Name
            Text(
              AppStrings.name,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),

            // Job Title Badge Chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: primaryColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.flutter_dash_rounded,
                    size: 18,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.jobTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Short Introduction Text
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                AppStrings.shortIntro,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // CTA Action Buttons
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () =>
                      onNavigateToTab(3), // Navigate to Projects tab
                  icon: const Icon(Icons.rocket_launch_rounded, size: 20),
                  label: const Text('View Projects'),
                ),
                OutlinedButton.icon(
                  onPressed: () =>
                      onNavigateToTab(5), // Navigate to Contact tab
                  icon: const Icon(Icons.mail_outline_rounded, size: 20),
                  label: const Text('Contact Me'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Social Media Buttons Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIconButton(
                  icon: Icons.code_rounded,
                  tooltip: 'GitHub',
                  onTap: () =>
                      UrlLauncherService.launchUrlString(AppStrings.github),
                ),
                const SizedBox(width: 12),
                _SocialIconButton(
                  icon: Icons.work_outline_rounded,
                  tooltip: 'LinkedIn',
                  onTap: () =>
                      UrlLauncherService.launchUrlString(AppStrings.linkedin),
                ),
                const SizedBox(width: 12),
                _SocialIconButton(
                  icon: Icons.chat_rounded,
                  tooltip: 'WhatsApp',
                  onTap: () =>
                      UrlLauncherService.openWhatsApp(AppStrings.whatsapp),
                ),
                const SizedBox(width: 12),
                _SocialIconButton(
                  icon: Icons.email_outlined,
                  tooltip: 'Email',
                  onTap: () => UrlLauncherService.openEmail(AppStrings.email),
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // Quick Stats Section
            const QuickStatsSection(),

            const SizedBox(height: 28),

            // Portfolio Section Shortcuts Grid
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore Portfolio',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.2,
                  children: [
                    _ShortcutTile(
                      title: 'About Me',
                      icon: Icons.person_rounded,
                      color: Colors.indigo,
                      onTap: () => onNavigateToTab(1),
                    ),
                    _ShortcutTile(
                      title: 'Skills Stack',
                      icon: Icons.psychology_rounded,
                      color: Colors.teal,
                      onTap: () => onNavigateToTab(2),
                    ),
                    _ShortcutTile(
                      title: 'Projects',
                      icon: Icons.folder_special_rounded,
                      color: Colors.amber.shade800,
                      onTap: () => onNavigateToTab(3),
                    ),
                    _ShortcutTile(
                      title: 'Work Experience',
                      icon: Icons.work_rounded,
                      color: Colors.deepOrange,
                      onTap: () => onNavigateToTab(4),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: isDark ? theme.colorScheme.surface : Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon, size: 22, color: theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

class _ShortcutTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ShortcutTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
