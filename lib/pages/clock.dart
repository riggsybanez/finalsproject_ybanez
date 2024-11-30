import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  DateTime _currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startClock();
  }

  void _startClock() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentDateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _adjustDateTime() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _currentDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_currentDateTime),
      );

      if (newTime != null) {
        setState(() {
          _currentDateTime = DateTime(
            newDate.year,
            newDate.month,
            newDate.day,
            newTime.hour,
            newTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Day and month names
    const List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    const List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    final formattedDate =
        "${days[_currentDateTime.weekday - 1]}, ${months[_currentDateTime.month - 1]} ${_currentDateTime.day}, ${_currentDateTime.year}";
    final formattedTime =
        "${_currentDateTime.hour % 12 == 0 ? 12 : _currentDateTime.hour % 12}:${_currentDateTime.minute.toString().padLeft(2, '0')} ${_currentDateTime.hour >= 12 ? 'PM' : 'AM'}";

    return BaseScreen(
      selectedIndex: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formattedTime,
              style: TextStyle(
                fontSize: 64,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _adjustDateTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              child: const Text(
                'Adjust Current Date & Time',
                style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
