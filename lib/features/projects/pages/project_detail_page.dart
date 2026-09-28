import 'package:flutter/material.dart';
import '../../../core/utils/url_launcher_service.dart';
import '../../../data/models/project_model.dart';
import '../../../shared/widgets/section_header.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: Text(project.name)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Header Banner Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withValues(alpha: 0.15),
                    theme.colorScheme.secondary.withValues(alpha: 0.15),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryColor.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.rocket_launch_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (project.isFeatured) ...[
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade800,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'Featured Showcase',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project.fullDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Key Features Checklist Section
            const SectionHeader(
              title: 'Key Features',
              subtitle:
                  'Comprehensive functionalities implemented in this project',
            ),
            const SizedBox(height: 8),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: project.features.map((feature) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 18,
                            color: Colors.green.shade600,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              feature,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Technologies Used Section
            const SectionHeader(
              title: 'Technologies & Tools',
              subtitle: 'Frameworks, packages & architecture',
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies.map((tech) {
                return Chip(
                  avatar: CircleAvatar(
                    backgroundColor: primaryColor.withValues(alpha: 0.2),
                    child: Icon(
                      Icons.code_rounded,
                      size: 14,
                      color: primaryColor,
                    ),
                  ),
                  label: Text(tech),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),

            // External Store Links Section
            if ((project.githubUrl != null && project.githubUrl!.isNotEmpty) ||
                (project.playStoreUrl != null &&
                    project.playStoreUrl!.isNotEmpty) ||
                (project.appStoreUrl != null &&
                    project.appStoreUrl!.isNotEmpty)) ...[
              const SectionHeader(
                title: 'Links & Deployment',
                subtitle: 'Source code repository and store releases',
              ),
              const SizedBox(height: 8),

              Column(
                children: [
                  if (project.githubUrl != null &&
                      project.githubUrl!.isNotEmpty)
                    _DetailLinkTile(
                      title: 'GitHub Repository',
                      subtitle: 'View source code & architecture details',
                      icon: Icons.code_rounded,
                      color: theme.colorScheme.onSurface,
                      onTap: () => UrlLauncherService.launchUrlString(
                        project.githubUrl!,
                      ),
                    ),
                  if (project.playStoreUrl != null &&
                      project.playStoreUrl!.isNotEmpty)
                    _DetailLinkTile(
                      title: 'Google Play Store',
                      subtitle: 'Download on Android devices',
                      icon: Icons.android_rounded,
                      color: Colors.green.shade700,
                      onTap: () => UrlLauncherService.launchUrlString(
                        project.playStoreUrl!,
                      ),
                    ),
                  if (project.appStoreUrl != null &&
                      project.appStoreUrl!.isNotEmpty)
                    _DetailLinkTile(
                      title: 'Apple App Store',
                      subtitle: 'Download on iOS devices',
                      icon: Icons.apple_rounded,
                      color: Colors.blue.shade700,
                      onTap: () => UrlLauncherService.launchUrlString(
                        project.appStoreUrl!,
                      ),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DetailLinkTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DetailLinkTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        trailing: const Icon(Icons.open_in_new_rounded, size: 18),
        onTap: onTap,
      ),
    );
  }
}
