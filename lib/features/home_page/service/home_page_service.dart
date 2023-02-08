import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobs_post/core/constants/app_constaints.dart';

import '../model/get_jobs_model.dart';

class HomePageService {
  final _dio = Dio();

  Future<List<JobsModel>?> getJobs() async {
    try {
      var response = await _dio.get('${AppConstaints.baseUrl}getJobs');
      if (response.statusCode == 200) {
        return jobsModelFromJson(json.encode(response.data));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Get Jobs Error : $e');
      return null;
    }
  }
}
