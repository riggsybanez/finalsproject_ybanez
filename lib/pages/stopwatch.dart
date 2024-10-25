import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '00:00:00',
              style: TextStyle(
                fontSize: 64,
                color: Color.fromARGB(255, 220, 220, 220),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play',
                  style: TextStyle(color: Color.fromARGB(255, 66, 66, 66))),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
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
