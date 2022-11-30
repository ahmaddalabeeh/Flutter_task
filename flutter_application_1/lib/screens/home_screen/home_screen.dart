import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/job_model.dart';
import 'package:flutter_application_1/data/repositories/job_repo.dart';
import 'package:flutter_application_1/enum/sort_type_enum.dart';
import 'package:flutter_application_1/providers/job_provider.dart';
import 'package:flutter_application_1/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text(
          "Job List",
          style:
              TextStyle(color: Colors.white70, letterSpacing: 4, fontSize: 24),
        ),
      ),
      body: FutureBuilder<void>(
        future:
            Provider.of<JobProvider>(context, listen: false).getJobs(context),
        builder: (context, jobs) {
          if (jobs.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<JobProvider>(context, listen: false).sortType =
                        SortTypeEnum.alphabeticalOrder;
                  },
                  icon: Icon(Icons.sort_by_alpha)),
              IconButton(
                  onPressed: () {
                    Provider.of<JobProvider>(context, listen: false).sortType =
                        SortTypeEnum.salary;
                  },
                  icon: Icon(Icons.sort_rounded)),
              Expanded(
                child:
                    Consumer<JobProvider>(builder: (context, jobProvider, _) {
                  return ListView.builder(
                    itemCount: jobProvider.jobs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => JobCard(
                      jobModel: jobProvider.jobs[index],
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
      // body: StreamBuilder<ConnectivityResult?>(
      //   initialData: ConnectivityResult.none,
      //   stream: Connectivity().onConnectivityChanged,
      //   builder: (context, internetConnection) {
      //     if (internetConnection.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (internetConnection.data == ConnectivityResult.wifi ||
      //         internetConnection.data == ConnectivityResult.mobile) {
      //       return
      //     } else {
      //       return const Center(child: Text("Failed connection"));
      //     }
      //   },
      // ),
    );
  }
}
