import 'package:equatable/equatable.dart';

class ExperienceModel extends Equatable {
  final String company;
  final String position;
  final String duration;
  final String location;
  final String description;
  final List<String> technologies;

  const ExperienceModel({
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.description,
    required this.technologies,
  });

  Map<String, dynamic> toMap() {
    return {
      'company': company,
      'position': position,
      'duration': duration,
      'location': location,
      'description': description,
      'technologies': technologies,
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      company: map['company'] ?? '',
      position: map['position'] ?? '',
      duration: map['duration'] ?? '',
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      technologies: List<String>.from(map['technologies'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    company,
    position,
    duration,
    location,
    description,
    technologies,
  ];
}
