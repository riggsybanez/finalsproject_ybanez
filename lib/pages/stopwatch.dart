import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  late Timer _timer;
  bool _isRunning = false;
  Duration _elapsedTime = Duration.zero;

  void _startStopwatch() {
    if (_isRunning) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += const Duration(seconds: 1);
      });
    });
  }

  void _stopStopwatch() {
    if (!_isRunning) return;

    _isRunning = false;
    _timer.cancel();
  }

  void _resetStopwatch() {
    _stopStopwatch();
    setState(() {
      _elapsedTime = Duration.zero;
    });
  }

  @override
  void dispose() {
    if (_isRunning) _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatDuration(_elapsedTime),
              style: const TextStyle(
                fontSize: 64,
                color: Color.fromARGB(255, 220, 220, 220),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text(
                    'Start',
                    style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _stopStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  icon: const Icon(Icons.pause),
                  label: const Text(
                    'Stop',
                    style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _resetStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Reset',
                    style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
