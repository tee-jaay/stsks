import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';
import 'components/assignee/assignees_list.dart';
import 'components/budget/budget.dart';
import 'components/communicate/communicate.dart';
import 'components/meta/meta.dart';
import 'components/prj_dates/prj_dates.dart';
import 'components/source/sources.dart';

class ProjectInfo extends StatelessWidget {
  String title;
  String description;
  String image;
  String status;
  String commentsCount;
  String estimate;
  String spent;
  String createdBy;
  String repoLink;
  String urlOne;
  String urlTwo;
  String createdAt;
  String updatedAt;
  List<dynamic> assignees;

  ProjectInfo({
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    required this.commentsCount,
    required this.estimate,
    required this.spent,
    required this.createdBy,
    required this.repoLink,
    required this.urlOne,
    required this.urlTwo,
    required this.createdAt,
    required this.updatedAt,
    required this.assignees,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: appDefaultSpace),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Meta(
                title: title,
                description: description,
                image: image,
                status: status,
                commentsCount: commentsCount,
                createdBy: createdBy,
              ),
              SizedBox(
                height: appDefaultSpace,
              ),
              Budget(
                estimate: estimate,
                spent: spent,
              ),
              SizedBox(
                height: appDefaultSpace,
              ),
              AssigneesList(assignees: assignees),
              SizedBox(
                height: appDefaultSpace,
              ),
              const Communicate(),
              SizedBox(
                height: appDefaultSpace,
              ),
              Sources(
                repoLink: repoLink,
                urlOne: urlOne,
                urlTwo: urlTwo,
              ),
              SizedBox(
                height: appDefaultSpace,
              ),
              PrjDates(
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
