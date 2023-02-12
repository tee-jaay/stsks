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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _agendaController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  late TimeOfDay _selectedTime = TimeOfDay.now();

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
      print(err.toString());
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
                ),
                const SizedBox(height: appDefaultSpace,),
                TextField(
                  controller: _agendaController,
                  decoration: const InputDecoration(
                    hintText: 'Agenda',
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: appDefaultSpace,),
                TextField(
                  autofocus: true,
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: 'Address'),
                ),
                const SizedBox(height: appDefaultSpace,),
                TextField(
                  autofocus: true,
                  controller: _locationController,
                  decoration: const InputDecoration(hintText: 'Location'),
                ),
                const SizedBox(height: appDefaultSpace,),
                Text(
                  _selectedDate == null
                      ? 'No date chosen'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
                const SizedBox(height: appDefaultSpace,),
                TextButton(
                  onPressed: _selectDate,
                  child: const Text('Choose date'),
                ),
                const SizedBox(height: appDefaultSpace,),
                Text(
                  _selectedTime == null
                      ? 'No time chosen'
                      : 'Picked Time: ${_selectedTime.format(context)}',
                ),
                const SizedBox(height: appDefaultSpace,),
                TextButton(
                  onPressed: _selectTime,
                  child: Text('Choose time'),
                ),
                const SizedBox(height: appDefaultSpace,),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                const SizedBox(height: appDefaultSpace,),
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
