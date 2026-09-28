import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String name;
  final String jobTitle;
  final String shortIntro;
  final String aboutSummary;
  final String degree;
  final String institution;
  final String educationPeriod;
  final String email;
  final String phone;
  final String whatsapp;
  final String github;
  final String linkedin;

  const ProfileModel({
    required this.name,
    required this.jobTitle,
    required this.shortIntro,
    required this.aboutSummary,
    required this.degree,
    required this.institution,
    required this.educationPeriod,
    required this.email,
    required this.phone,
    required this.whatsapp,
    required this.github,
    required this.linkedin,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'jobTitle': jobTitle,
      'shortIntro': shortIntro,
      'aboutSummary': aboutSummary,
      'degree': degree,
      'institution': institution,
      'educationPeriod': educationPeriod,
      'email': email,
      'phone': phone,
      'whatsapp': whatsapp,
      'github': github,
      'linkedin': linkedin,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      shortIntro: map['shortIntro'] ?? '',
      aboutSummary: map['aboutSummary'] ?? '',
      degree: map['degree'] ?? '',
      institution: map['institution'] ?? '',
      educationPeriod: map['educationPeriod'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      github: map['github'] ?? '',
      linkedin: map['linkedin'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
    name,
    jobTitle,
    shortIntro,
    aboutSummary,
    degree,
    institution,
    educationPeriod,
    email,
    phone,
    whatsapp,
    github,
    linkedin,
  ];
}
