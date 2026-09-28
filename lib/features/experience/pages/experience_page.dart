import 'package:flutter/material.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../data/local/hive_service.dart';
import '../../../shared/widgets/section_header.dart';
import '../widgets/experience_card.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PortfolioRepository(HiveService());
    final experiences = repository.getExperiences();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Work Experience',
              subtitle: 'Professional mobile engineering career trajectory',
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return ExperienceCard(
                  experience: experiences[index],
                  isLast: index == experiences.length - 1,
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
