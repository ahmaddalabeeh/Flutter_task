import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/job_model.dart';
import 'package:flutter_application_1/screens/job_info_screen/job_info_screen.dart';

// A shared widget that takes the JobModel and its' parameters to view them on screen
class JobCard extends StatelessWidget {
  final JobModel jobModel;

  const JobCard({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobInformationPage(jobModel: jobModel),
          ),
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          leading: Image.network(
            jobModel.companyLogo,
            height: size.height * 0.2,
            fit: BoxFit.contain,
          ),
          title: Text(
            jobModel.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                ),
          ),
          subtitle: Text(
            jobModel.companyName,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black54,
                ),
          ),
          trailing: Text(
            jobModel.salary,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.green,
                ),
          ),
        ),
      ),
    );
  }
}

// Container(
//       margin: const EdgeInsets.all(10),
//       height: size.height * 0.3,
//       width: size.width * 0.3,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(15),
//         image: DecorationImage(
//           image: NetworkImage(jobModel.companyLogo),
//           colorFilter: ColorFilter.mode(
//               Colors.black.withOpacity(0.35), BlendMode.multiply),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: size.height * 0.02,
//                 ),
//                 child: Text(
//                   jobModel.title,
//                   style: const TextStyle(fontSize: 26, color: Colors.white70),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: size.height * 0.02,
//                 ),
//                 child: Text(
//                   jobModel.companyName,
//                   style: const TextStyle(fontSize: 26, color: Colors.white70),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
