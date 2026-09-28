import 'package:flutter/material.dart';
import '../../../data/models/skill_model.dart';

class SkillChip extends StatelessWidget {
  final SkillModel skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final isTop = skill.isTopSkill;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isTop
            ? primaryColor.withValues(alpha: 0.14)
            : theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTop
              ? primaryColor.withValues(alpha: 0.5)
              : theme.colorScheme.onSurface.withValues(alpha: 0.15),
          width: isTop ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isTop ? Icons.star_rounded : Icons.check_circle_outline_rounded,
            size: 16,
            color: isTop
                ? primaryColor
                : theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          const SizedBox(width: 8),
          Text(
            skill.name,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: isTop ? FontWeight.bold : FontWeight.w500,
              color: isTop ? primaryColor : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
