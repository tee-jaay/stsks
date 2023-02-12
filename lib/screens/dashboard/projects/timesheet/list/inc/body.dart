import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../settings/constants.dart';
import '../../../../../../controllers/auth_controller.dart';
import '../../../../../../controllers/timesheet_controller.dart';

class Body extends StatefulWidget {
  Body({required this.projectId, Key? key}) : super(key: key);
  String projectId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FocusNode _timeFocusNode = FocusNode();
  final FocusNode _noteFocusNode = FocusNode();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Future<void> _refreshProjectTimeSheets(
      BuildContext context, id, accessToken) async {
    await Provider.of<TimesheetController>(context, listen: false)
        .index(projectId: id, accessToken: accessToken);
  }

  void _showAddLogDialog(
      {required String timeSheetId, required String accessToken}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Time Log'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: _dayController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Day (2)'),
                  onEditingComplete: () => FocusScope.of(context).requestFocus(_timeFocusNode),
                ),
                TextField(
                  focusNode: _timeFocusNode,
                  controller: _timeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Hour (1~8)'),
                  onEditingComplete: () => FocusScope.of(context).requestFocus(_noteFocusNode),
                ),
                TextField(
                  focusNode: _noteFocusNode,
                  controller: _noteController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Note...'),
                  maxLines: 4,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _dayController.clear();
                _timeController.clear();
                _noteController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                var newObj = {
                  "day": _dayController.text.toString(),
                  "time": _timeController.text.toString(),
                  "note": _noteController.text.toString()
                };
                Provider.of<TimesheetController>(context, listen: false)
                    .update(
                        timeSheetId: timeSheetId,
                        accessToken: accessToken,
                        newObj: newObj)
                    .then((value) {
                  if (value == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Timelog added',
                        style: TextStyle(color: Colors.green),
                      ),
                    ));
                    Provider.of<TimesheetController>(context, listen: false)
                        .clearTimeSheet();
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Error occurred',
                        style: TextStyle(color: Colors.red),
                      ),
                    ));
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
          ],
        );
      },
    );
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
                  onRefresh: () => _refreshProjectTimeSheets(
                      context, widget.projectId, accessToken),
                  child: Consumer<TimesheetController>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.timeSheetsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        'Task: ${value.timeSheetsList[index].title}',
                                        softWrap: true,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                    ),
                                    Text(
                                      'Entry By: ${value.timeSheetsList[index].createdBy}',
                                      style: const TextStyle(
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: appDefaultSpace,
                                ),
                                Text(
                                  value.timeSheetsList[index].task,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                const SizedBox(
                                  height: appDefaultSpace,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: GridView.builder(
                                    itemBuilder: (ctx, i) => Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.black12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(value.timeSheetsList[index]
                                              .logs[i]["day"]),
                                          Text(value.timeSheetsList[index]
                                                  .logs[i]["time"] ??
                                              ""),
                                          Text(
                                            value.timeSheetsList[index].logs[i]
                                                ["note"],
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    itemCount:
                                        value.timeSheetsList[index].logs.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 70.0,
                                  child: TextButton(
                                    onPressed: () => _showAddLogDialog(
                                      timeSheetId:
                                          value.timeSheetsList[index].id,
                                      accessToken: accessToken,
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: Colors.black87,
                                        ),
                                        Text(
                                          'Log',
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          future:
              _refreshProjectTimeSheets(context, widget.projectId, accessToken),
        ),
      ),
    );
  }
}
