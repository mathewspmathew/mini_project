import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini4/textfields.dart';

import 'feed.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _dropdownValue = "";
  List<String> dropDownOptions = [
    "Male",
    "Female",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController phonenumber = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController address = TextEditingController();
    double height = 200;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  color: const Color.fromRGBO(6, 210, 255, 100).withOpacity(1),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white)),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Create My Profile',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.75),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(color: Colors.white, width: 3),
                      image: const DecorationImage(
                          image: AssetImage('assets/profile_icon.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyTextField(mycontroller: namecontroller, mylabel: 'Name'),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 12),
                Image.asset('assets/flag.png', width: 20, height: 20),
                SizedBox(
                    width: 150,
                    child: MyTextField(
                      mycontroller: phonenumber,
                      mylabel: 'Phone number',
                      myicon: 'assets/f1.png',
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 12),
                DropdownButton(
                    hint: const Text('Gender'),
                    value: _dropdownValue != "" ? _dropdownValue : null,
                    items: dropDownOptions
                        .map((option) => DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      dropdownCallback(value);
                    }),
                const SizedBox(width: 50),
                _selectedDate != null
                    ? Text(DateFormat('dd-MM-yyyy').format(_selectedDate!),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)))
                    : Text('Date of Birth',
                        style: TextStyle(color: Colors.black.withOpacity(0.6))),
                const SizedBox(width: 12),
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            const SizedBox(height: 30),
            MyTextField(mycontroller: email, mylabel: 'Email'),
            const SizedBox(height: 30),
            MyTextField(mycontroller: address, mylabel: 'Address'),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          const Color.fromRGBO(6, 209, 255, 0.801)
                              .withOpacity(1))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
