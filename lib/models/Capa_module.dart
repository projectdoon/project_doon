class ProjectDate {
  final int id;
  final String dateDescription;
  final String dateName;
  final DateTime date;
  final int projectID;

  ProjectDate({
    required this.id,
    required this.dateDescription,
    required this.dateName,
    required this.date,
    required this.projectID,
  });

  factory ProjectDate.fromJson(Map<String, dynamic> json) {
    return ProjectDate(
      id: json['id'],
      dateDescription: json['dateDescription'],
      dateName: json['dateName'],
      date: DateTime.parse(json['date']),
      projectID: json['projectID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateDescription': dateDescription,
      'dateName': dateName,
      'date': date.toIso8601String(),
      'projectID': projectID,
    };
  }
}

class Project {
  final int id;
  final String projectName;
  final String departmentName;
  final String projectDescription;
  final DateTime startDate;
  final DateTime endDate;
  final String? addressLineOne;
  final String? addressLineTwo;
  final String district;
  final String state;
  final String authorityName;
  final String organization;
  final int status;
  final String uploadedBy;
  final List<ProjectDate> projectDates;

  Project({
    required this.id,
    required this.projectName,
    required this.departmentName,
    required this.projectDescription,
    required this.startDate,
    required this.endDate,
    this.addressLineOne,
    this.addressLineTwo,
    required this.district,
    required this.state,
    required this.authorityName,
    required this.organization,
    required this.status,
    required this.uploadedBy,
    required this.projectDates,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    var datesJson = json['projectDates'] as List<dynamic>? ?? [];
    List<ProjectDate> dates = datesJson.map((dateJson) => ProjectDate.fromJson(dateJson)).toList();

    return Project(
      id: json['id'],
      projectName: json['projectName'],
      departmentName: json['departmentName'],
      projectDescription: json['projectDescription'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      addressLineOne: json['addressLineOne'],
      addressLineTwo: json['addressLineTwo'],
      district: json['district'],
      state: json['state'],
      authorityName: json['authorityName'],
      organization: json['organization'],
      status: json['status'],
      uploadedBy: json['uploadedBy'],
      projectDates: dates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectName': projectName,
      'departmentName': departmentName,
      'projectDescription': projectDescription,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'addressLineOne': addressLineOne,
      'addressLineTwo': addressLineTwo,
      'district': district,
      'state': state,
      'authorityName': authorityName,
      'organization': organization,
      'status': status,
      'uploadedBy': uploadedBy,
      'projectDates': projectDates.map((pd) => pd.toJson()).toList(),
    };
  }
}
