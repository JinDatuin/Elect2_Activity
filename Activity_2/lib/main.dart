import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Screen App',
      theme: ThemeData(primarySwatch: Colors.blue),

      // Define named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}

// 🏠 First Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Dashboard Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            SizedBox(height: 16), // spacing between buttons
            ElevatedButton(
              child: Text('Go to About Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 📄 Second Screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            // Go back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            // Go back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
