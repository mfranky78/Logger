import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logging/errorpage.dart';

void main() {
  
  
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/errorScreen': (context) => ErrorScreen("Ein Fehler ist aufgetreten."),
        '/infoScreen': (context) => InfoScreen("Dies ist eine Info Nachricht."),
        '/warningScreen': (context) => WarningScreen("Dies ist eine Warnung Nachricht."),
        '/fehlerseite':(context) => Fehlerseite(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Logger logger = Logger();

  List<String> logMessages = [];

  void _logMessage(BuildContext context, String message, Level level) {
    logger.log(level, message);
    if (level == Level.error) {
    Navigator.of(context).pushNamed('/errorScreen');
    } else if (level == Level.info) {
      Navigator.of(context).pushNamed('/infoScreen');
    } else if (level == Level.warning) {
      Navigator.of(context).pushNamed('/warningScreen');
    }else if (level == Level.warning) {
       Navigator.of(context).pushNamed('/fehlerseite');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logger-App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              color: Colors.blueGrey,
              child: ElevatedButton(
                onPressed: () => _logMessage(
                    context, "Dies ist eine Info-Nachricht", Level.info),
                child: const Text('Info Nachricht'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              color: Colors.orange,
              child: ElevatedButton(
                onPressed: () => _logMessage(
                    context, "Dies ist eine Warnung-Nachricht", Level.warning),
                child: const Text('Warnung Nachricht'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              color: Colors.red,
              child: ElevatedButton(
                onPressed: () => _logMessage(
                    context, "Dies ist eine Fehler-Nachricht", Level.error),
                child: const Text('Fehler Nachricht'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              color: Colors.green,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fehlerseite');
                },
                child: const Text('Fehler Seite'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  ErrorScreen(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Fehler-Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error,
              size: 150.0,
              color: Colors.red,
            ),
            Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  final String infoMessage;

  InfoScreen(this.infoMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info-Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.info,
              size: 100.0,
              color: Colors.blue,
            ),
            Text(
              infoMessage,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarningScreen extends StatelessWidget {
  final String warningMessage;

  WarningScreen(this.warningMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Warnung-Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.warning,
              size: 100.0,
              color: Colors.orange,
            ),
            Text(
              warningMessage,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
