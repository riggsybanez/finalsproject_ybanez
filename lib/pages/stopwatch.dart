import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  String _time = '00:00:00';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _time,
              style: const TextStyle(
                fontSize: 64,
                color: Color.fromARGB(255, 220, 220, 220),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _time = '00:00:01';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play',
                  style: TextStyle(color: Color.fromARGB(255, 66, 66, 66))),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _time = '00:00:00';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset',
                  style: TextStyle(color: Color.fromARGB(255, 66, 66, 66))),
            ),
          ],
        ),
      ),
    );
  }
}
