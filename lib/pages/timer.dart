import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2,
      child: TimerList(),
    );
  }
}

class TimerList extends StatefulWidget {
  @override
  _TimerListState createState() => _TimerListState();
}

class _TimerListState extends State<TimerList> {
  List<TimerItem> _timers = <TimerItem>[];

  void _addTimer() {
    setState(() {
      _timers.add(TimerItem());
    });
  }

  void _removeTimer(TimerItem timerItem) {
    setState(() {
      _timers.remove(timerItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _timers.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: IconButton(
                    icon: _timers[index].isRunning
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: () {
                      if (_timers[index].isRunning) {
                        _timers[index].pause();
                      } else {
                        _timers[index].start();
                        Timer(const Duration(milliseconds: 10), () {
                          setState(() {});
                        });
                      }
                    },
                  ),
                  title: TextField(
                    controller: _timers[index].titleController,
                    decoration: const InputDecoration(hintText: 'Alarm Title'),
                  ),
                  subtitle: ValueListenableBuilder<Duration>(
                    valueListenable: _timers[index],
                    builder: (context, duration, child) {
                      return Text(_timers[index].formattedDuration);
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => _timers[index].reset(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeTimer(_timers[index]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            bottom: 16 + kBottomNavigationBarHeight,
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.grey[300],
            onPressed: _addTimer,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class TimerItem extends ValueNotifier<Duration> {
  final TextEditingController titleController = TextEditingController();
  Timer? _timer;
  Duration _duration = Duration.zero;
  bool _isRunning = false;

  TimerItem() : super(Duration.zero);

  String get formattedDuration {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(_duration.inHours);
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  bool get isRunning => _isRunning;

  void start() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _duration += const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void pause() {
    _isRunning = false;
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _isRunning = false;
    _timer?.cancel();
    _timer = null;
    _duration = Duration.zero;
    notifyListeners();
  }
}
