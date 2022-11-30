import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_source/remote/remote_job_handler.dart';
import 'package:flutter_application_1/data/models/job_model.dart';

// Repository class to determine what kind of data are we receiving (remote or local, in this case we don't have local data). Singleton type class to save memory
class JobRepo {
  static final JobRepo instance = JobRepo._internal();
  JobRepo._internal();
  Future<List<JobModel>?> getJobs(BuildContext context) async {
    try {
      return await RemoteJobHandler.instance.getJobs();
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const Dialog(
              child: Center(
                child: Text("Failed to fetch jobs"),
              ),
            );
          });
    }
    return null;
  }
}
