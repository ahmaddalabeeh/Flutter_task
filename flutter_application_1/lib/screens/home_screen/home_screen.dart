import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/enum/sort_type_enum.dart';
import 'package:flutter_application_1/providers/job_provider.dart';
import 'package:flutter_application_1/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(
          "Job List",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white70,
              ),
        ),
      ),
      body: StreamBuilder<ConnectivityResult?>(
        initialData: ConnectivityResult.none,
        stream: Connectivity().onConnectivityChanged,
        builder: (context, internetConnection) {
          if (internetConnection.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (internetConnection.data == ConnectivityResult.wifi ||
              internetConnection.data == ConnectivityResult.mobile) {
            return FutureBuilder<void>(
              future: jobProvider.getJobs(context),
              builder: (context, jobs) {
                if (jobs.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Consumer<JobProvider>(
                          builder: (context, jobProvider, _) {
                            return Switch.adaptive(
                              value: jobProvider.asc,
                              onChanged: (value) {
                                jobProvider.asc = value;
                              },
                            );
                          },
                        ),
                        Consumer<JobProvider>(
                          builder: (context, jobProvider, child) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                jobProvider.asc ? "Ascending" : "Descending",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            );
                          },
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          margin: const EdgeInsets.all(8),
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {
                            showMenu(
                              context: context,
                              position: RelativeRect.fill,
                              items: [
                                PopupMenuItem(
                                  child: const Text("Alphabetical"),
                                  onTap: () {
                                    jobProvider.sortType =
                                        SortTypeEnum.alphabeticalOrder;
                                  },
                                ),
                                PopupMenuItem(
                                  child: const Text("Salary"),
                                  onTap: () {
                                    jobProvider.sortType = SortTypeEnum.salary;
                                  },
                                ),
                              ],
                            );
                          },
                          icon: const Icon(Icons.sort_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Consumer<JobProvider>(
                          builder: (context, jobProvider, _) {
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
            );
          } else {
            return const Center(child: Text("Failed connection"));
          }
        },
      ),
    );
  }
}
