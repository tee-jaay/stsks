import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../list/tasks_list_screen.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/task_controller.dart';
import '../../../../../settings/constants.dart';

class TaskEditScreen extends StatefulWidget {
  static String screenId = "task_edit_screen";

  const TaskEditScreen({Key? key}) : super(key: key);

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  late String _priority = "Low";
  List<String> _priorities = ["Critical", "Low", "Medium", "High"];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  late String _selectedStatus = "active";
  List<String> _statusOptions = [
    "active",
    "cancelled",
    "completed",
    "review",
    "not started"
  ];

  late String _title = '';
  late String _description = '';
  late bool _bookmark = false;

  // Planned start date
  late DateTime _selectedPlannedStartDate = DateTime.now();

  _selectPlannedStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedPlannedStartDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedPlannedStartDate) {
      setState(() {
        _selectedPlannedStartDate = picked;
      });
    }
  }

// Planned end date
  late DateTime _selectedPlannedEndDate = DateTime.now();

  _selectPlannedEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedPlannedEndDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedPlannedEndDate) {
      setState(() {
        _selectedPlannedEndDate = picked;
      });
    }
  }

// Actual start date
  late DateTime _selectedActualStartDate = DateTime.now();

  _selectActualStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedActualStartDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedActualStartDate) {
      setState(() {
        _selectedActualStartDate = picked;
      });
    }
  }

// Planned end date
  late DateTime _selectedActualEndDate = DateTime.now();

  _selectActualEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedActualEndDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedActualEndDate) {
      setState(() {
        _selectedActualEndDate = picked;
      });
    }
  }

  _handleSubmit({required taskId, required accessToken, required createdBy}) {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    //
    // Object newTaskObj = {
    //   "title": _title,
    //   "description": _description,
    //   "bookmark": _bookmark,
    //   "status": _selectedStatus,
    //   "plannedStart": _selectedPlannedStartDate.toString(),
    //   "plannedEnd": _selectedPlannedEndDate.toString(),
    //   "actualStart": _selectedActualStartDate.toString(),
    //   "actualEnd": _selectedActualEndDate.toString(),
    //   "priority": _priority,
    // };
    // Provider.of<TaskController>(context, listen: false)
    //     .store(accessToken: accessToken, newTaskObj: newTaskObj)  .then((value) {
    //   if (value == 201) {
    //     Navigator.of(context).pushReplacementNamed(TasksListScreen.screenId, arguments: projectId);
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //           'Task added',
    //           style: TextStyle(color: Colors.lightGreenAccent),
    //         )));
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //           'Task create failed',
    //           style: TextStyle(color: Colors.amber),
    //         )));
    //   }
    // });
  }

  Future<void> _getTaskData(
      BuildContext ctx, String taskId, String accessToken) async {
    Provider.of<TaskController>(ctx, listen: false)
        .show(taskId: taskId, accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context, listen: true).user;
    final taskId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              )),
        ],
      ),
      body: FutureBuilder(
          future: _getTaskData(context, taskId, user.accessToken),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      _getTaskData(context, taskId, user.accessToken),
                  child: Consumer<TaskController>(
                    builder: (context, value, child) {
                      _titleController..text = value.task.title;
                      _descriptionController..text = value.task.description;
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(appDefaultSpace),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // title
                                    TextFormField(
                                      autofocus: true,
                                      controller: _titleController,
                                      validator: (String? val) {
                                        if (val!.isEmpty) {
                                          return 'Title is required';
                                        } else if (val.length < 4) {
                                          return 'Minimum length 4 chars';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                        if (_selectedStatus != value) {
                                          _titleController.text = val;
                                          _titleController.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: val.length));
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          hintText: 'Title'),
                                      keyboardType: TextInputType.text,
                                      focusNode: _titleFocusNode,
                                      onFieldSubmitted: (value) =>
                                          FocusScope.of(context).requestFocus(
                                              _descriptionFocusNode),
                                    ),
                                    // title

                                    // description
                                    TextFormField(
                                      //readOnly: loading,
                                      controller: _descriptionController,
                                      validator: (String? v) {
                                        if (v!.isEmpty) {
                                          return 'Description is required';
                                        } else if (v.length < 6) {
                                          return 'Description is too short';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                        _descriptionController.text = val;
                                        _descriptionController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: val.length));
                                      },
                                      decoration: const InputDecoration(
                                          hintText: 'Description'),
                                      keyboardType: TextInputType.multiline,
                                      focusNode: _descriptionFocusNode,
                                    ),
                                    // description

                                    // status
                                    DropdownButtonFormField(
                                      value: _selectedStatus,
                                      items: _statusOptions.map((status) {
                                        return DropdownMenuItem(
                                          value: status,
                                          child: Text(status),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedStatus = value.toString();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Select a status',
                                      ),
                                    ),
                                    // status
                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),
                                    // planned start date
                                    InkWell(
                                      onTap: () =>
                                          _selectPlannedStartDate(context),
                                      child: Text(
                                          'Planned Start Date: ${_selectedPlannedStartDate == null ? 'Select a date' : DateFormat.yMMMMd().format(_selectedPlannedStartDate)}'),
                                    ),
                                    // planned start date
                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),
                                    // planned end date
                                    InkWell(
                                      onTap: () =>
                                          _selectPlannedEndDate(context),
                                      child: Text(
                                          'Planned End Date: ${_selectedPlannedEndDate == null ? 'Select a date' : DateFormat.yMMMMd().format(_selectedPlannedEndDate)}'),
                                    ),
                                    // planned end date
                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),
                                    // Actual start date
                                    InkWell(
                                      onTap: () =>
                                          _selectActualStartDate(context),
                                      child: Text(
                                          'Actual Start Date: ${_selectedActualStartDate == null ? 'Select a date' : DateFormat.yMMMMd().format(_selectedActualStartDate)}'),
                                    ),
                                    // Actual start date
                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),

                                    // Actual end date
                                    InkWell(
                                      onTap: () =>
                                          _selectActualEndDate(context),
                                      child: Text(
                                          'Actual End Date: ${_selectedActualEndDate == null ? 'Select a date' : DateFormat.yMMMMd().format(_selectedActualEndDate)}'),
                                    ),
                                    // Actual start date
                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),

                                    // Priority
                                    Container(
                                      child: Row(
                                        children: [
                                          for (var priority in _priorities)
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 20.0),
                                              child: Column(
                                                children: [
                                                  Radio(
                                                    value: priority,
                                                    groupValue:
                                                        value.task.priority,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        _priority =
                                                            val as String;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    priority,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    // Priority

                                    const SizedBox(
                                      height: appDefaultSpace * 2,
                                    ),

                                    TextButton(
                                      onPressed: () => _handleSubmit(
                                          taskId: taskId,
                                          accessToken: user.accessToken,
                                          createdBy: user.username),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                // loading ? Colors.grey :
                                                Colors.green),
                                      ),
                                      child: Text(
                                        'Update',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
    );
  }
}
