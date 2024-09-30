import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenOne()),
            );
          },
          child: const Text('Go to Screen One'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenTwo()),
            );
          },
          child: const Text('Go to Screen Two'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenThree()),
            );
          },
          child: const Text('Go to Screen Three'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenFour()),
            );
          },
          child: const Text('Go to Screen Four'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenFive()),
            );
          },
          child: const Text('Go to Screen Five'),
        ),
      ])),
    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Return to Home Screen'),
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Return to Home Screen'),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Three'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Return to Home Screen'),
        ),
      ),
    );
  }
}

class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Four'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Return to Home Screen'),
        ),
      ),
    );
  }
}

class ScreenFive extends StatelessWidget {
  const ScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Return to Home Screen'),
        ),
      ),
    );
  }
}
