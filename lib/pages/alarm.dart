import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  List<AlarmModel> alarms = [];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[300],
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: const Icon(Icons.alarm),
                    title: Text(alarms[index].title),
                    subtitle: Text(alarms[index].time),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final newAlarm = await _showEditAlarmDialog(
                                context, alarms[index]);
                            if (newAlarm != null) {
                              setState(() {
                                alarms[index] = newAlarm;
                              });
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              alarms.removeAt(index);
                            });
                          },
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
              onPressed: () async {
                final newAlarm = await _showEditAlarmDialog(context);
                if (newAlarm != null) {
                  setState(() {
                    alarms.add(newAlarm);
                  });
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Future<AlarmModel?> _showEditAlarmDialog(BuildContext context,
      [AlarmModel? alarm]) async {
    final titleController = TextEditingController();
    final timeController = TextEditingController();

    if (alarm != null) {
      titleController.text = alarm.title;
      timeController.text = alarm.time;
    }

    return showDialog<AlarmModel?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Alarm'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Alarm Title'),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(hintText: 'Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    AlarmModel(
                      title: titleController.text,
                      time: timeController.text,
                    ));
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class AlarmModel {
  final String title;
  final String time;

  AlarmModel({
    required this.title,
    required this.time,
  });

  @override
  String toString() {
    return 'AlarmModel{title: $title, time: $time}';
  }
}
