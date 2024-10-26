import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 2,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[300],
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {},
                    ),
                    title: Text('Timer ${index + 1}'),
                    subtitle: const Text('00:00:00'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
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
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
