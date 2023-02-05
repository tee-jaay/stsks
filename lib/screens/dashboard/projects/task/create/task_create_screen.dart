import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/controllers/auth_controller.dart';
import 'package:prozeqts/controllers/task_controller.dart';

import '../../../../../settings/constants.dart';

class TaskCreateScreen extends StatefulWidget {
  static String screenId = "task_create_screen";

  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();

  _handleSubmit(projectId, accessToken) {
    Provider.of<TaskController>(context, listen: false)
        .store(projectId: projectId, accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final accessToken =
        Provider.of<AuthController>(context, listen: true).user.accessToken;
    final projectId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              )),
        ],
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(appDefaultSpace),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    TextFormField(
                      //readOnly: loading,
                      controller: _titleController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (!regExpEmail.hasMatch(value)) {
                          return 'Email is invalid';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) => setState(() {
                        // _email = value;
                      }),
                      decoration: const InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      // focusNode: _emailFocusNode,
                      // onFieldSubmitted: (value) =>
                      //     FocusScope.of(context)                          .requestFocus(_passwordFocusNode),
                    ),
                    const SizedBox(
                      height: appDefaultSpace,
                    ),
                    TextButton(
                        onPressed: () => _handleSubmit(projectId, accessToken),
                        child: Text('Add')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
