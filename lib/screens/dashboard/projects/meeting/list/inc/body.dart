import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/auth_controller.dart';
import '../../../../../../controllers/meeting_controller.dart';
import '../../single/MeetingSingle.dart';

class Body extends StatelessWidget {
  Body({
    required this.projectId,
    Key? key,
  }) : super(key: key);
  String projectId;

  Future<void> _refreshProjectMeetings(
      BuildContext context, id, accessToken) async {
    await Provider.of<MeetingController>(context, listen: false)
        .index(projectId: id, accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final accessToken =
        Provider.of<AuthController>(context, listen: false).user.accessToken;
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: FutureBuilder(
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      _refreshProjectMeetings(context, projectId, accessToken),
                  child: Consumer<MeetingController>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.meetingsList.length,
                      itemBuilder: (context, index) {
                        return MeetingSingle(
                          meeting: value.meetingsList[index],
                        );
                      },
                    ),
                  ),
                ),
          future: _refreshProjectMeetings(context, projectId, accessToken),
        ),
      ),
    );
  }
}
