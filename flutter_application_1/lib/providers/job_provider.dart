import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/job_model.dart';
import 'package:flutter_application_1/data/repositories/job_repo.dart';
import 'package:flutter_application_1/enum/sort_type_enum.dart';

//Provider class to sort the jobs list alphabetically ASC/DES and Salary wise ASC/DES
class JobProvider with ChangeNotifier {
  bool _asc = true;
  SortTypeEnum _sortType = SortTypeEnum.alphabeticalOrder;
  SortTypeEnum get sortType => _sortType;
  bool get asc => _asc;
  List<JobModel>? _jobs = [];

  List<JobModel> get jobs => _jobs ?? [];

  set asc(bool value) {
    _asc = value;
    _sort();
  }

  set sortType(SortTypeEnum value) {
    _sortType = value;
    _sort();
  }

  void _sortByAlphabetical() {
    jobs.sort((a, b) {
      if (asc) {
        return a.title.compareTo(b.title);
      } else {
        return b.title.compareTo(a.title);
      }
    });
  }

  void _sortBySalary() {
    jobs.sort((a, b) {
      if (asc) {
        return a.salary.compareTo(b.salary);
      } else {
        return b.salary.compareTo(a.salary);
      }
    });
  }

  void _sort() {
    switch (sortType) {
      case SortTypeEnum.alphabeticalOrder:
        _sortByAlphabetical();
        break;
      case SortTypeEnum.salary:
        _sortBySalary();
        break;
    }
    notifyListeners();
  }

  Future<void> getJobs(BuildContext context) async {
    _jobs = (await JobRepo.instance.getJobs(context));
    _sort();
  }
}
