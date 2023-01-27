import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/auth_controller.dart';
import '../../../../../../controllers/timesheet_controller.dart';

class Body extends StatelessWidget {
  Body({required this.projectId, Key? key}) : super(key: key);
  String projectId;

  Future<void> _refreshProjectTimeSheets(
      BuildContext context, id, accessToken) async {
    await Provider.of<TimesheetController>(context, listen: false)
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
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () => _refreshProjectTimeSheets(
                          context, projectId, accessToken),
                      child: Consumer<TimesheetController>(
                        builder: (context, value, child) => ListView.builder(
                          itemCount: value.timeSheetsList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 8.0),
                                child: Text(
                                  value.timeSheetsList[index].title,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
          future: _refreshProjectTimeSheets(context, projectId, accessToken),
        ),
      ),
    );
  }
}
