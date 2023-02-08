import 'package:flutter/material.dart';
import 'package:jobs_post/features/home_page/model/get_jobs_model.dart';
import 'package:jobs_post/features/home_page/service/home_page_service.dart';


enum HomePageState { loading, loaded, error }

class HomePageViewModel extends ChangeNotifier {
  List<JobsModel>? _getJobsModel;
  HomePageState _getDataJobsState = HomePageState.loading;

  HomePageViewModel() {
    getData();
  }

  Future<List<JobsModel>?> getData() async {
    try {
      var data = await HomePageService().getJobs();
      if (data != null) {
        getJobsModel = data;
        getDataJobsState = HomePageState.loaded;
        return getJobsModel;
      } else {
        getDataJobsState = HomePageState.error;
      }
    } catch (e) {
      debugPrint('Jobs Get Data Error : $e');
      return null;
    }
    return null;
  }

  List<JobsModel>? get getJobsModel => _getJobsModel;
  set getJobsModel(List<JobsModel>? value) {
    _getJobsModel = value;
    notifyListeners();
  }

  HomePageState get getDataJobsState => _getDataJobsState;
  set getDataJobsState(HomePageState value) {
    _getDataJobsState = value;
    notifyListeners();
  }
}
