import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Days Lived Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DaysLivedCalculator(),
    );
  }
}

class DaysLivedCalculator extends StatefulWidget {
  @override
  _DaysLivedCalculatorState createState() => _DaysLivedCalculatorState();
}

class _DaysLivedCalculatorState extends State<DaysLivedCalculator> {
  // Declare variables to store the birth date and current date
  late DateTime _birthDate;
  late DateTime _currentDate;

  // Initialize the birth date to the current date
  // (this will be changed later by the user)
  @override
  void initState() {
    super.initState();
    _birthDate = DateTime.now();
    _currentDate = DateTime.now();
  }

  // This function calculates the number of days lived
  // by subtracting the birth date from the current date
  int _calculateDaysLived() {
    return _currentDate.difference(_birthDate).inDays;
  }

  // This function builds the UI of the app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Days Lived Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            // Show the birth date
            Text('Birth Date: ${_birthDate.toString()}'),

            // Show the current date
            Text('Current Date: ${_currentDate.toString()}'),

            // Show the number of days lived
            Text('Days Lived: ${_calculateDaysLived()}'),

            // A button to change the birth date
            Container(
              child: OutlinedButton(
                child: Text('Change Birth Date'),
                onPressed: () async {
                  // Show a date picker and wait for the user to select a date
                  DateTime? newBirthDate = await showDatePicker(
                    context: context,
                    initialDate: _birthDate,
                    firstDate: DateTime(1900),
                    lastDate: _currentDate,
                  );

                  // If the user selected a new birth date,
                  // update the birth date and refresh the UI
                  if (newBirthDate != null) {
                    setState(() {
                      _birthDate = newBirthDate;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
