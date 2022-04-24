class ProjectInfo {
  ProjectInfo(this.contact_name, this.project_name, this.status);

  final String contact_name;
  final String project_name;
  final String status;
}

class Projects {
  final String name;
  final String title;
  final String description;

  Projects({required this.name, required this.title, required this.description});

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      name: json['name'],
      title: json['title'],
      description: json['description'],
    );
  }
}
