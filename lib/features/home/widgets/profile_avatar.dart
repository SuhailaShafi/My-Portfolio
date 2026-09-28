import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;

  const ProfileAvatar({super.key, this.radius = 56.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer animated gradient glow border
        Container(
          width: (radius * 2) + 12,
          height: (radius * 2) + 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [primaryColor, secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withValues(alpha: 0.35),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        // Inner circle with photo / illustration avatar
        CircleAvatar(
          radius: radius,
          backgroundColor: theme.scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: radius - 4,
            backgroundColor: primaryColor.withValues(alpha: 0.12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flutter_dash_rounded,
                  size: radius * 0.9,
                  color: primaryColor,
                ),
                Text(
                  'SP',
                  style: TextStyle(
                    fontSize: radius * 0.35,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Verified Flutter Developer badge
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.scaffoldBackgroundColor,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
