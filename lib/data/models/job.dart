import 'dart:convert';

class Job {
  final int id;
  final int companyId;
  final int categoryId;
  final String companyName;
  final String companyLogo;
  final String companyAbout;
  final String role;
  final String location;
  final String jobType;
  final String jobLink;
  final String description;
  final List<String> skills;
  final int applicants;
  final int views;
  final String publishedDate;
  final bool isBookmarked;
  final bool isApplied;

  const Job({
    required this.id,
    required this.companyId,
    required this.categoryId,
    required this.companyName,
    required this.companyLogo,
    required this.companyAbout,
    required this.role,
    required this.location,
    required this.jobType,
    required this.jobLink,
    required this.description,
    required this.skills,
    required this.applicants,
    required this.views,
    required this.publishedDate,
    this.isBookmarked = false,
    this.isApplied = false,
  });

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['id'],
      companyId: map['companyId'],
      categoryId: map['categoryId'],
      companyName: map['companyName'] ?? '',
      companyLogo: map['companyLogo'] ?? '',
      companyAbout: map['companyAbout'] ?? '',
      role: map['role'] ?? '',
      location: map['location'] ?? '',
      jobType: map['jobType'] ?? '',
      jobLink: map['jobLink'] ?? '',
      description: map['description'] ?? '',
      skills: map['skills'] is String
          ? List<String>.from(json.decode(map['skills']))
          : List<String>.from(map['skills'] ?? []),
      applicants: map['applicants'] ?? 0,
      views: map['views'] ?? 0,
      publishedDate: map['publishedDate'] ?? '',
      isBookmarked: (map['isBookmarked'] ?? 0) == 1,
      isApplied: (map['isApplied'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyId': companyId,
      'categoryId': categoryId,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'companyAbout': companyAbout,
      'role': role,
      'location': location,
      'jobType': jobType,
      'jobLink': jobLink,
      'description': description,
      'skills': json.encode(skills),
      'applicants': applicants,
      'views': views,
      'publishedDate': publishedDate,
      'isBookmarked': isBookmarked ? 1 : 0,
      'isApplied': isApplied ? 1 : 0,
    };
  }

  Job copyWith({
    int? id,
    int? companyId,
    int? categoryId,
    String? companyName,
    String? companyLogo,
    String? companyAbout,
    String? role,
    String? location,
    String? jobType,
    String? jobLink,
    String? description,
    List<String>? skills,
    int? applicants,
    int? views,
    String? publishedDate,
    bool? isBookmarked,
    bool? isApplied,
  }) {
    return Job(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      categoryId: categoryId ?? this.categoryId,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      companyAbout: companyAbout ?? this.companyAbout,
      role: role ?? this.role,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      jobLink: jobLink ?? this.jobLink,
      description: description ?? this.description,
      skills: skills ?? this.skills,
      applicants: applicants ?? this.applicants,
      views: views ?? this.views,
      publishedDate: publishedDate ?? this.publishedDate,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isApplied: isApplied ?? this.isApplied,
    );
  }

  @override
  String toString() {
    return 'Job(id: $id, role: $role, company: $companyName, applied: $isApplied, bookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Job && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
