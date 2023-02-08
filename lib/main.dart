import 'package:flutter/material.dart';
import 'package:jobs_post/features/add_jobs/view_model/add_jobs_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import 'features/home_page/view/home_page.dart';
import 'features/home_page/view_model/home_page_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(create: (_) => HomePageViewModel()),
        ChangeNotifierProvider<AddJobsViewModel>(create: (_) => AddJobsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
