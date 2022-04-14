import 'package:get/get.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/models/job_model.dart';
import 'package:newsanbercode/routing/routes_named.dart';

var c = Get.find<DashboardController>();

class GoToDetailPage {
  void goToDetailPage(JobModel items) {
    c.jobDetail.value = JobModel(
      jobId: items.jobId,
      title: items.title,
      location: items.location,
      idr: items.idr,
      time: items.time,
      companyName: items.companyName,
      companyLogo: items.companyLogo,
      content: items.content,
      jobDesc: items.jobDesc,
      criteria: items.criteria,
    );

    Get.toNamed(RoutesName.job_detail_page);
  }
}
