import 'package:flutter/material.dart';
import 'package:jobs_post/features/add_jobs/view_model/add_jobs_view_model.dart';
import 'package:jobs_post/features/home_page/view_model/home_page_view_model.dart';
import 'package:jobs_post/widget/customTextField.dart';
import 'package:provider/provider.dart';

class AddJobs extends StatefulWidget {
  const AddJobs({super.key});

  @override
  State<AddJobs> createState() => _AddJobsState();
}

class _AddJobsState extends State<AddJobs> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddJobsViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('İş İlanı Ekle'),
      ),
      body: Form(
        key: provider.addJobsKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(controller: provider.catagoryController, hintText: 'İlan Kategorisi'),
              CustomTextFormField(controller: provider.companyNameController, hintText: 'İlan Başlığı'),
              CustomTextFormField(controller: provider.departmentController, hintText: 'Departman'),
              CustomTextFormField(controller: provider.jobDescriptionController, hintText: 'İlan Açıklaması'),
              CustomTextFormField(controller: provider.countryController, hintText: 'İl'),
              ElevatedButton(
                  onPressed: () {
                    if (provider.addJobsKey.currentState!.validate()) {
                      provider.addJobs(context).then((value) {
                        if (value != null) {
                          context.read<HomePageViewModel>().getData();
                        }
                      });
                    }
                  },
                  child: const Text('Ekle'))
            ],
          ),
        ),
      ),
    );
  }
}
