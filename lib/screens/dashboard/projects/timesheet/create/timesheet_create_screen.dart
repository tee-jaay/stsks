import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../settings/constants.dart';
import '../../../../../controllers/task_controller.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/timesheet_controller.dart';

class TimeSheetCreateScreen extends StatefulWidget {
  static String screenId = "timesheet_create_screen";

  const TimeSheetCreateScreen({Key? key}) : super(key: key);

  @override
  State<TimeSheetCreateScreen> createState() => _TimeSheetCreateScreenState();
}

class _TimeSheetCreateScreenState extends State<TimeSheetCreateScreen> {
  final TextEditingController _titleController = TextEditingController();

  late String _selectedTask = "";

  Future<void> _refreshProjectTasks(
      {required BuildContext ctx,
      required String projectId,
      required String accessToken}) async {
    await Provider.of<TaskController>(ctx, listen: false)
        .index(projectId: projectId, accessToken: accessToken);
  }

  _handleSubmit(
      {required String createdBy,
      required String accessToken,
      required String projectId}) {
    Object newObj = {
      "createdBy": createdBy,
      "title": _titleController.text.toString(),
      "task": _selectedTask.toString(),
    };
    Provider.of<TimesheetController>(context, listen: false)
        .store(projectId: projectId, accessToken: accessToken, newObj: newObj)
        .then((value) {
      if (value == 201) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Timesheet added', style: TextStyle(color: Colors.green),)));
        Provider.of<TimesheetController>(context, listen: false)
            .clearTimeSheet();
        Navigator.pop(context);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error occured', style: TextStyle(color: Colors.red),)));
      }
    }).catchError((err) {
      print(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Timesheet',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(appDefaultSpace),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  autofocus: true,
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('For task: ',),
                FutureBuilder(
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? Container(
                            margin: const EdgeInsets.all(8.0),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => _refreshProjectTasks(
                              ctx: context,
                              projectId: projectId!,
                              accessToken: user.accessToken,
                            ),
                            child: Consumer<TaskController>(
                              builder: (context, value, child) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: ListView.builder(
                                    itemCount: value.tasksPreviews.length,
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                        value: value.tasksPreviews[index].title,
                                        groupValue: _selectedTask,
                                        onChanged: (v) {
                                          setState(() {
                                            _selectedTask = v.toString();
                                          });
                                        },
                                        title: Text(value
                                            .tasksPreviews[index].title
                                            .toString()),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                    future: _refreshProjectTasks(
                        ctx: context,
                        projectId: projectId!,
                        accessToken: user.accessToken)),
                TextButton(
                    onPressed: () => _handleSubmit(
                          accessToken: user.accessToken,
                          createdBy: user.username,
                          projectId: projectId,
                        ),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
