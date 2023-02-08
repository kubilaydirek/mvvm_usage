// To parse this JSON data, do
//
//     final jobsModel = jobsModelFromJson(jsonString);

import 'dart:convert';

List<JobsModel> jobsModelFromJson(String str) => List<JobsModel>.from(json.decode(str).map((x) => JobsModel.fromJson(x)));

String jobsModelToJson(List<JobsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsModel {
  JobsModel({
    this.id,
    this.category,
    this.companyName,
    this.department,
    this.jobDescription,
    this.country,
  });

  String? id;
  String? category;
  String? companyName;
  String? department;
  String? jobDescription;
  String? country;

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        id: json["_id"],
        category: json["category"],
        companyName: json["companyName"],
        department: json["department"],
        jobDescription: json["jobDescription"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "companyName": companyName,
        "department": department,
        "jobDescription": jobDescription,
        "country": country,
      };
}
