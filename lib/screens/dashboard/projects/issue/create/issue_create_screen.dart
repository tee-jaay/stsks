import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../settings/constants.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/issue_controller.dart';

class IssueCreateScreen extends StatefulWidget {
  static String screenId = "issues_create_screen";

  const IssueCreateScreen({Key? key}) : super(key: key);

  @override
  State<IssueCreateScreen> createState() => _IssueCreateScreenState();
}

class _IssueCreateScreenState extends State<IssueCreateScreen> {
  TextEditingController _titleTextContoller = TextEditingController();
  TextEditingController _descriptionTextContoller = TextEditingController();
  bool _isbookmark = false;

  late String _selectedStatus = "open";
  List<String> _statusOptions = [
    "open",
    "closed",
  ];

  late String _priority = "medium";
  List<String> _priorities = ["urgent", "low", "medium", "high"];

  late String _type = "bug";
  List<String> _types = [
    "bug",
    "security",
    "feature",
    "upgrade",
    "update",
    "maintenance"
  ];

  late String _severity = "moderate";
  List<String> _severities = ["minor", "major", "moderate", "critical"];

  _handleSubmit(
      {required String createdBy,
      required String accessToken,
      required String projectId}) {
    Object newIssue = {
      "createdBy": createdBy,
      "title": _titleTextContoller.text.toString(),
      "description": _descriptionTextContoller.text.toString(),
      "bookmark": _isbookmark,
      "status": _selectedStatus.toString(),
      "start": DateTime.now().toString(),
      "end": "",
      "priority": _priority,
      "type": _type,
      "severity": _severity,
    };
    IssueController issueController = IssueController();
    issueController
        .store(projectId: projectId, accessToken: accessToken, obj: newIssue)
        .then((value) {
      if (value == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Issue Created',
          style: TextStyle(
            color: Colors.green,
          ),
        ))        );
        Navigator.pop(context);
      }
    }).catchError((err) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Issue create failed',
        style: TextStyle(
          color: Colors.red,
        ),
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)!.settings.arguments.toString();
    final user = Provider.of<AuthController>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Issue',
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(appDefaultSpace),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  TextField(
                    autofocus: true,
                    controller: _titleTextContoller,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  // Title

                  // Description
                  TextField(
                    controller: _descriptionTextContoller,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  // Description

                  // Bookmark
                  Row(
                    children: [
                      Text("Bookmark"),
                      Checkbox(
                        value: _isbookmark,
                        onChanged: (value) => setState(() {
                          _isbookmark = value!;
                        }),
                      ),
                    ],
                  ),
                  // Bookmark

                  // Status
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
                  // Status

                  // Priority
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Priotiry: '),
                        Row(
                          children: [
                            for (var priority in _priorities)
                              Container(
                                margin: EdgeInsets.only(right: 20.0),
                                child: Column(
                                  children: [
                                    Radio(
                                      value: priority,
                                      groupValue: _priority,
                                      onChanged: (value) {
                                        setState(() {
                                          _priority = value as String;
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
                      ],
                    ),
                  ),
                  // Priority

                  // Type
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type:'),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width + 100,
                          child: Row(
                            children: [
                              for (var type in _types)
                                Container(
                                  margin: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      Radio(
                                        value: type,
                                        groupValue: _type,
                                        onChanged: (v) {
                                          setState(() {
                                            _type = v as String;
                                          });
                                        },
                                      ),
                                      Text(
                                        type,
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
                      ),
                    ],
                  ),
                  // Type

                  // Severity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Severity:'),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width + 100,
                          child: Row(
                            children: [
                              for (var severity in _severities)
                                Container(
                                  margin: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      Radio(
                                        value: severity,
                                        groupValue: _severity,
                                        onChanged: (s) {
                                          setState(() {
                                            _severity = s as String;
                                          });
                                        },
                                      ),
                                      Text(
                                        severity,
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
                      ),
                    ],
                  ),
                  // Severity

                  SizedBox(
                    height: appDefaultSpace,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                    onPressed: () => _handleSubmit(
                        createdBy: user.username,
                        projectId: projectId,
                        accessToken: user.accessToken),
                    child: Text(
                      'Add',
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
  }
}
