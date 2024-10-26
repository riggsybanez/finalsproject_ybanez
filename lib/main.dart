import 'package:flutter/material.dart';
import 'package:myapp/pages/alarm.dart';
import 'package:myapp/pages/clock.dart';
import 'package:myapp/pages/timer.dart';
import 'package:myapp/pages/stopwatch.dart';

void main() {
  runApp(const MaterialApp(
    home: Clock(),
  ));
}

class BaseScreen extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const BaseScreen(
      {super.key, required this.child, required this.selectedIndex});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  void _navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Alarm()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Clock()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Timer()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Stopwatch()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF808080),
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
            _navigateTo(context, index);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stopwatch',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
