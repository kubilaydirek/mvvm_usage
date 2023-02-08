import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobs_post/features/add_jobs/view_model/add_jobs_view_model.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../../add_jobs/view/add_jobs_view.dart';
import '../view_model/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomePageViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('İş İlanları'),
      ),
      floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            context.read<AddJobsViewModel>().clearInputData();
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddJobs()));
          },
          icon: const Icon(Icons.add),
          label: const Text('İş İlanı ekle')),
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: context.watch<HomePageViewModel>().getJobsModel?.length ?? 0,
            itemBuilder: (context, index) {
              return context.read<HomePageViewModel>().getDataJobsState == HomePageState.loaded
                  ? Column(
                      children: [
                        Card(
                          color: Colors.white60,
                          child: CupertinoListTile(
                            leading: const SizedBox(
                              width: 25,
                              height: 25,
                              child: Placeholder(),
                            ),
                            title: Text(provider.getJobsModel?[index].companyName ?? ''),
                            subtitle: Text(provider.getJobsModel?[index].country ?? ''),
                            trailing: CupertinoButton(onPressed: () {}, child: const Icon(Icons.chevron_right_outlined)),
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
