import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/job_model.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

//screen to view the Job's description through fetching the description parameter from the JobModel class
class JobInformationPage extends StatelessWidget {
  final JobModel jobModel;

  const JobInformationPage({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    String myHtml = jobModel.description;
    var document = parse(myHtml);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          onPressed: _launchURL,
          child: Text(
            "Go to URL",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Description",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white70,
              ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            parse(document.body!.text).documentElement!.text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  Future<dynamic>? _launchURL() async {
    var url = Uri.parse(jobModel.url);
    return await launchUrl(url);
  }
}
