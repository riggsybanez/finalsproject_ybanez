import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Friday, October 25, 2024',
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '12:00 PM',
              style: TextStyle(
                fontSize: 64,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
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
