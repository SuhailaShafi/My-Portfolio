import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final List<String> features;
  final List<String> technologies;
  final String? imagePath;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool isFeatured;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.features,
    required this.technologies,
    this.imagePath,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.isFeatured = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'features': features,
      'technologies': technologies,
      'imagePath': imagePath,
      'githubUrl': githubUrl,
      'playStoreUrl': playStoreUrl,
      'appStoreUrl': appStoreUrl,
      'isFeatured': isFeatured,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      shortDescription: map['shortDescription'] ?? '',
      fullDescription: map['fullDescription'] ?? '',
      features: List<String>.from(map['features'] ?? []),
      technologies: List<String>.from(map['technologies'] ?? []),
      imagePath: map['imagePath'],
      githubUrl: map['githubUrl'],
      playStoreUrl: map['playStoreUrl'],
      appStoreUrl: map['appStoreUrl'],
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  ProjectModel copyWith({
    String? id,
    String? name,
    String? shortDescription,
    String? fullDescription,
    List<String>? features,
    List<String>? technologies,
    String? imagePath,
    String? githubUrl,
    String? playStoreUrl,
    String? appStoreUrl,
    bool? isFeatured,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      fullDescription: fullDescription ?? this.fullDescription,
      features: features ?? this.features,
      technologies: technologies ?? this.technologies,
      imagePath: imagePath ?? this.imagePath,
      githubUrl: githubUrl ?? this.githubUrl,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    shortDescription,
    fullDescription,
    features,
    technologies,
    imagePath,
    githubUrl,
    playStoreUrl,
    appStoreUrl,
    isFeatured,
  ];
}
