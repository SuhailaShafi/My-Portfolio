import '../../core/constants/app_strings.dart';
import '../local/hive_service.dart';
import '../models/experience_model.dart';
import '../models/profile_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioRepository {
  final HiveService _hiveService;

  PortfolioRepository(this._hiveService);

  ProfileModel getProfile() {
    return const ProfileModel(
      name: AppStrings.name,
      jobTitle: AppStrings.jobTitle,
      shortIntro: AppStrings.shortIntro,
      aboutSummary: AppStrings.aboutSummary,
      degree: AppStrings.degree,
      institution: AppStrings.institution,
      educationPeriod: AppStrings.educationPeriod,
      email: AppStrings.email,
      phone: AppStrings.phone,
      whatsapp: AppStrings.whatsapp,
      github: AppStrings.github,
      linkedin: AppStrings.linkedin,
    );
  }

  List<SkillModel> getSkills() {
    return const [
      // Flutter & Mobile
      SkillModel(
        name: 'Flutter',
        category: SkillCategory.flutterAndMobile,
        isTopSkill: true,
      ),
      SkillModel(
        name: 'Dart',
        category: SkillCategory.flutterAndMobile,
        isTopSkill: true,
      ),
      SkillModel(name: 'Android', category: SkillCategory.flutterAndMobile),
      SkillModel(name: 'iOS', category: SkillCategory.flutterAndMobile),

      // State Management
      SkillModel(
        name: 'BLoC',
        category: SkillCategory.stateManagement,
        isTopSkill: true,
      ),
      SkillModel(name: 'Provider', category: SkillCategory.stateManagement),
      SkillModel(name: 'GetX', category: SkillCategory.stateManagement),

      // Backend & Storage
      SkillModel(
        name: 'Firebase',
        category: SkillCategory.backendAndStorage,
        isTopSkill: true,
      ),
      SkillModel(
        name: 'REST API',
        category: SkillCategory.backendAndStorage,
        isTopSkill: true,
      ),
      SkillModel(
        name: 'Hive',
        category: SkillCategory.backendAndStorage,
        isTopSkill: true,
      ),
      SkillModel(name: 'JSON', category: SkillCategory.backendAndStorage),

      // Tools & Deployment
      SkillModel(name: 'Git', category: SkillCategory.toolsAndDeployment),
      SkillModel(name: 'GitHub', category: SkillCategory.toolsAndDeployment),
      SkillModel(name: 'Xcode', category: SkillCategory.toolsAndDeployment),
      SkillModel(name: 'App Store', category: SkillCategory.toolsAndDeployment),
      SkillModel(
        name: 'Play Store',
        category: SkillCategory.toolsAndDeployment,
      ),
    ];
  }

  List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        company: 'Ontrends',
        position: 'Flutter Developer',
        duration: '2023 - Present',
        location: 'Oman',
        description:
            'Oman-based company. Developed food delivery and e-commerce applications using Flutter and Dart. Integrated Firebase Authentication, Firestore, Firebase Storage, GetX state management, Hive local database, Localization, and Git.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'Firestore',
          'Firebase Authentication',
          'Firebase Storage',
          'GetX',
          'Hive',
          'Localization',
          'Git',
        ],
      ),
      ExperienceModel(
        company: 'Supportta Solutions',
        position: 'Flutter Developer',
        duration: '2022 - 2023',
        location: 'India',
        description:
            'Hands-on Flutter application development using Dart, implementing modern state management patterns, integrating RESTful APIs, and utilizing AI-assisted development tools for rapid engineering.',
        technologies: [
          'Flutter',
          'Dart',
          'State Management',
          'API Integration',
          'AI Development Tools',
          'Git',
        ],
      ),
      ExperienceModel(
        company: 'Webarclight',
        position: 'Flutter Developer',
        duration: '2021 - 2022',
        location: 'India',
        description:
            'Flutter application development focused on iOS deployment, Xcode configuration, App Store submission workflows, and troubleshooting Info.plist and iOS deployment issues.',
        technologies: [
          'Flutter',
          'iOS Deployment',
          'Xcode',
          'App Store Submission',
          'Info.plist Troubleshooting',
        ],
      ),
      ExperienceModel(
        company: 'Zeolans Technologies',
        position: 'Android Developer',
        duration: '2020 - 2021',
        location: 'India',
        description:
            'Native Android application development using Java. Engineered features for e-commerce applications, hospital-related management systems, and social media application platforms.',
        technologies: [
          'Android Development',
          'Java',
          'E-commerce Applications',
          'Hospital Applications',
          'Social Media Applications',
        ],
      ),
    ];
  }

  List<ProjectModel> _getDefaultProjects() {
    return const [
      ProjectModel(
        id: 'proj_ontrends',
        name: 'Ontrends Food & E-commerce',
        shortDescription:
            'A food, grocery, and essential delivery application designed for convenient shopping and fast delivery.',
        fullDescription:
            'Ontrends Food & E-commerce is a comprehensive delivery application designed to provide users with convenient food ordering, grocery shopping, and essential item delivery with multi-language localization and Firebase backend integration.',
        features: [
          'User authentication',
          'Food browsing & ordering',
          'Grocery shopping',
          'Product browsing & search',
          'Smart cart & order placement',
          'Delivery tracking',
          'Firebase Authentication, Firestore & Storage',
          'Multi-language localization',
          'User profile management',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'GetX',
          'Hive',
          'Firebase',
          'Firestore',
          'Firebase Authentication',
          'Firebase Storage',
        ],
        githubUrl: 'https://github.com/suhailaparvin/ontrends-food-app',
        isFeatured: true,
      ),
      ProjectModel(
        id: 'proj_askmydok',
        name: 'AskMyDok',
        shortDescription:
            'Healthcare tele-health platform for doctor search, appointment scheduling, and consultations.',
        fullDescription:
            'AskMyDok is a digital health mobile application enabling patients to search verified doctors, schedule appointments, conduct tele-consultation calls, and manage digital health records.',
        features: [
          'Doctor search & profile details',
          'Appointment booking & scheduling',
          'Tele-consultation video features',
          'Digital health records storage',
          'Real-time chat & push notifications',
          'Medical lab test booking',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
          'BLoC',
          'Push Notifications',
          'Payment Gateway',
        ],
        githubUrl: 'https://github.com/suhailaparvin/askmydok-flutter',
        isFeatured: true,
      ),
      ProjectModel(
        id: 'proj_portfolio_app',
        name: 'Flutter Portfolio App',
        shortDescription:
            'A professional Flutter portfolio application demonstrating Flutter development, BLoC state management, Hive local storage, responsive UI, reusable widgets, theme management, and clean project architecture.',
        fullDescription:
            'A professional Flutter portfolio application demonstrating Flutter development, BLoC state management, Hive local storage, responsive UI, reusable widgets, theme management, and clean project architecture.',
        features: [
          'Professional profile section',
          'Categorized technical skills stack',
          'Work experience timeline',
          'Completed real projects portfolio',
          'Contact section with link services',
          'Light/Dark/System theme management',
          'Local theme & project persistence in Hive',
          'Responsive UI for iOS and Android',
        ],
        technologies: [
          'Flutter',
          'Dart',
          'BLoC',
          'Hive',
          'Repository Pattern',
          'Git/GitHub',
        ],
        githubUrl: 'https://github.com/suhailaparvin/flutter-portfolio-app',
        isFeatured: true,
      ),
    ];
  }

  Future<List<ProjectModel>> getProjects() async {
    final savedData = _hiveService.getSavedProjects();
    if (savedData != null && savedData.isNotEmpty) {
      final list = savedData.map((map) => ProjectModel.fromMap(map)).toList();
      // Ensure stale box cache containing Zayla gets replaced with updated default projects
      if (list.any(
        (p) => p.id == 'proj_zayla' || p.id == 'proj_portfolio_app',
      )) {
        final defaults = _getDefaultProjects();
        await saveProjects(defaults);
        return defaults;
      }
      return list;
    }

    // Seed default projects into Hive
    final defaults = _getDefaultProjects();
    await saveProjects(defaults);
    return defaults;
  }

  Future<void> saveProjects(List<ProjectModel> projects) async {
    final mapList = projects.map((p) => p.toMap()).toList();
    await _hiveService.saveProjects(mapList);
  }

  Future<List<ProjectModel>> addProject(ProjectModel newProject) async {
    final currentList = await getProjects();
    final updatedList = List<ProjectModel>.from(currentList)..add(newProject);
    await saveProjects(updatedList);
    return updatedList;
  }

  Future<List<ProjectModel>> updateProject(ProjectModel project) async {
    final currentList = await getProjects();
    final updatedList = currentList
        .map((p) => p.id == project.id ? project : p)
        .toList();
    await saveProjects(updatedList);
    return updatedList;
  }

  Future<List<ProjectModel>> deleteProject(String projectId) async {
    final currentList = await getProjects();
    final updatedList = currentList.where((p) => p.id != projectId).toList();
    await saveProjects(updatedList);
    return updatedList;
  }
}
