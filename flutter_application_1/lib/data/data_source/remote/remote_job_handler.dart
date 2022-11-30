import 'dart:convert';
import 'package:flutter_application_1/data/constants/end_points.dart';
import 'package:flutter_application_1/data/models/job_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

// response handler class to handle all the data coming from the internet through APIs, which is also a singleton type class so we don't create an instance each time we use it, saving memory.
class RemoteJobHandler {
  static final RemoteJobHandler instance = RemoteJobHandler._internal();
  RemoteJobHandler._internal();

  Future<List<JobModel>> getJobs() async {
    try {
      var url = Uri.parse(EndPoints.baseUrl + EndPoints.getJobsEndPoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var document = parse(response.body);
        var jobs = jsonDecode(response.body)['jobs'];

        List<JobModel> jobList = [];
        for (var job in jobs) {
          jobList.add(JobModel.fromJson(job));
        }
        return jobList;
      } else {
        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed");
    }
  }
}
