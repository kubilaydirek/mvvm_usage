import 'package:flutter/material.dart';
import 'package:jobs_post/features/add_jobs/service/add_jobs_service.dart';
import 'package:jobs_post/features/home_page/view/home_page.dart';

enum AddJobsState { loading, loaded, error }

class AddJobsViewModel extends ChangeNotifier {
  TextEditingController catagoryController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  AddJobsState _addJobsState = AddJobsState.loading;
  var addJobsKey =GlobalKey<FormState>();

  Future<dynamic> addJobs(context) async {
    Map<String, dynamic> data = {
      "category": catagoryController.text,
      "companyName": companyNameController.text,
      "department": departmentController.text,
      "jobDescription": jobDescriptionController.text,
      "country": countryController.text,
    };
    try {
      var response = await AddJobsService().addJobs(data, context);
      if (response != null) {
        addJobsState = AddJobsState.loaded;
        Navigator.of(context).push(MaterialPageRoute<dynamic>(builder: (context) {
          return const HomePage();
        }));
        return response;
      } else {
        addJobsState = AddJobsState.error;
        return null;
      }
    } catch (e) {
      debugPrint('Add jobs error : $e');
      return null;
    }
  }

  void clearInputData() {
    catagoryController.clear();
    companyNameController.clear();
    departmentController.clear();
    jobDescriptionController.clear();
    countryController.clear();
    notifyListeners();
  }

  AddJobsState get addJobsState => _addJobsState;
  set addJobsState(AddJobsState value) {
    _addJobsState = value;
    notifyListeners();
  }
}
