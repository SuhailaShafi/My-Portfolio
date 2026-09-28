import 'package:flutter/material.dart';
import '../../../data/models/skill_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../data/local/hive_service.dart';
import '../../../shared/widgets/section_header.dart';
import '../widgets/skill_chip.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repository = PortfolioRepository(HiveService());
    final allSkills = repository.getSkills();

    // Group skills by category
    final Map<SkillCategory, List<SkillModel>> categorizedSkills = {};
    for (var category in SkillCategory.values) {
      categorizedSkills[category] = allSkills
          .where((s) => s.category == category)
          .toList();
    }

    final topSkills = allSkills.where((s) => s.isTopSkill).toList();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Technical Skills',
              subtitle:
                  'Core competencies, state management & deployment tools',
            ),
            const SizedBox(height: 8),

            // Top Skills Spotlight Banner
            Card(
              elevation: 0,
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.workspace_premium_rounded,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Core Highlights',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: topSkills
                          .map((skill) => SkillChip(skill: skill))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categorized Skill Sections
            ...SkillCategory.values.map((category) {
              final skills = categorizedSkills[category] ?? [];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _getCategoryIcon(category),
                              color: theme.colorScheme.primary,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              category.displayName,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${skills.length} skills',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Divider(height: 1),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: skills
                              .map((skill) => SkillChip(skill: skill))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(SkillCategory category) {
    switch (category) {
      case SkillCategory.flutterAndMobile:
        return Icons.flutter_dash_rounded;
      case SkillCategory.stateManagement:
        return Icons.account_tree_rounded;
      case SkillCategory.backendAndStorage:
        return Icons.cloud_done_rounded;
      case SkillCategory.toolsAndDeployment:
        return Icons.build_circle_rounded;
    }
  }
}
