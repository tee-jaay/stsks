import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/meeting_controller.dart';
import '../../../../../settings/constants.dart';

class MeetingCreateScreen extends StatefulWidget {
  static String screenId = "meetings_create_screen";

  const MeetingCreateScreen({Key? key}) : super(key: key);

  @override
  State<MeetingCreateScreen> createState() => _MeetingCreateScreenState();
}

class _MeetingCreateScreenState extends State<MeetingCreateScreen> {
  final FocusNode _durationFocusNode = FocusNode();
  final FocusNode _agendaFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _agendaController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();
  late TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate() async {
    BuildContext dialogContext = context;
    final DateTime? picked = await showDatePicker(
      context: dialogContext,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  _handleSubmit(
      {required String createdBy,
      required String accessToken,
      required String projectId}) {
    Object newObj = {
      "createdBy": createdBy,
      "title": _titleController.text.toString(),
      "date": _selectedDate.toString(),
      "time": _selectedTime.toString(),
      "duration": _durationController.text.toString(),
      "agenda": _agendaController.text.toString(),
      "location": _locationController.text.toString(),
      "address": _addressController.text.toString(),
      "phone": _phoneController.text.toString(),
    };
    Provider.of<MeetingController>(context, listen: false)
        .store(projectId: projectId, accessToken: accessToken, newObj: newObj)
        .then((value) {
      if (value == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Meeting added',
          style: TextStyle(color: Colors.green),
        )));
        Provider.of<MeetingController>(context, listen: false).clearMeetings();
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Error occurred',
          style: TextStyle(color: Colors.red),
        )));
      }
    }).catchError((err) {
      if (kDebugMode) {
        print(err.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Meeting',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Card(
        child: Container(
          padding: const EdgeInsets.all(appDefaultSpace),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  autofocus: true,
                  controller: _titleController,
                  decoration: const InputDecoration(hintText: 'Title'),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_agendaFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextField(
                  focusNode: _agendaFocusNode,
                  controller: _agendaController,
                  decoration: const InputDecoration(
                    hintText: 'Agenda',
                  ),
                  maxLines: 4,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_durationFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextField(
                  focusNode: _durationFocusNode,
                  controller: _durationController,
                  decoration: const InputDecoration(
                    hintText: 'Duration in (hr:min)',
                  ),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_addressFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextField(
                  focusNode: _addressFocusNode,
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: 'Address'),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_locationFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextField(
                  focusNode: _locationFocusNode,
                  controller: _locationController,
                  decoration: const InputDecoration(hintText: 'Location'),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_phoneFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextField(
                  focusNode: _phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_dateFocusNode),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                Text(
                  _selectedDate == null
                      ? 'No date chosen'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                  focusNode: _dateFocusNode,
                  onPressed: _selectDate,
                  child: const Text('Choose date'),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                Text(
                  _selectedTime == null
                      ? 'No time chosen'
                      : 'Picked Time: ${_selectedTime.format(context)}',
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                  focusNode: _timeFocusNode,
                  onPressed: _selectTime,
                  child: const Text('Choose time'),
                ),
                const SizedBox(
                  height: appDefaultSpace,
                ),
                TextButton(
                    onPressed: () => _handleSubmit(
                          accessToken: user.accessToken,
                          createdBy: user.username,
                          projectId: projectId!,
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
