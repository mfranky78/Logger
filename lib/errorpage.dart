import 'package:flutter/material.dart';


class Fehlerseite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Error',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Error Widget'),
      ),
      body: Column(
        children: [
          Container(height: 150,width: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),),
          Center(
            child: ElevatedButton(
              child: Text('Throw Error'),
              onPressed: () {
                throw Exception('An error has occurred!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
