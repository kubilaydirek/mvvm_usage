import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobs_post/widget/customSnackbar.dart';

class AddJobsService {
  var dio = Dio();

  Future<dynamic> addJobs(data, context) async {
    try {
      var response = await dio.post('http://localhost:3000/addJobPosting', data: data);
      if (response.statusCode == 200) {
        showCustomSnacbar(context, 'İlanınız başarılı bir şekilde eklenmiştir.', Colors.blue);
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint('Add Jobs Error : $e');
      showCustomSnacbar(context, 'İlan Kaydedilemedi', Colors.red);
      return null;
    }
  }
}
