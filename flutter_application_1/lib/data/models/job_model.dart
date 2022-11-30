// job model class to template the data needed to fetch from the API
class JobModel {
  final String url;
  final String title;
  final String companyName;
  final String companyLogo;
  final String salary;
  final String description;
  JobModel(
      {required this.url,
      required this.title,
      required this.companyName,
      required this.companyLogo,
      required this.salary,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
      'company_name': companyName,
      'company_logo': companyLogo,
      'salary': salary,
      'description': description,
    };
  }

  factory JobModel.fromJson(Map<String, dynamic> map) {
    print("sssss ${map['salary']}");
    return JobModel(
      url: map['url'] ?? '',
      title: map['title'] ?? '',
      companyName: map['company_name'] ?? '',
      companyLogo: map['company_logo'] ?? '',
      salary: map['salary'].toString(),
      description: map['description'] ?? '',
    );
  }
}
