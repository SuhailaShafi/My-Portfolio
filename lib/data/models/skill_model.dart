import 'package:equatable/equatable.dart';

enum SkillCategory {
  flutterAndMobile('Flutter & Mobile'),
  stateManagement('State Management'),
  backendAndStorage('Backend & Storage'),
  toolsAndDeployment('Tools & Deployment');

  final String displayName;
  const SkillCategory(this.displayName);
}

class SkillModel extends Equatable {
  final String name;
  final SkillCategory category;
  final String? iconPath;
  final bool isTopSkill;

  const SkillModel({
    required this.name,
    required this.category,
    this.iconPath,
    this.isTopSkill = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category.name,
      'iconPath': iconPath,
      'isTopSkill': isTopSkill,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'] ?? '',
      category: SkillCategory.values.firstWhere(
        (c) => c.name == map['category'],
        orElse: () => SkillCategory.flutterAndMobile,
      ),
      iconPath: map['iconPath'],
      isTopSkill: map['isTopSkill'] ?? false,
    );
  }

  @override
  List<Object?> get props => [name, category, iconPath, isTopSkill];
}
