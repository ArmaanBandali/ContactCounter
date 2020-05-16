import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: ContactCounter(),
      ),
    );

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
      ),
    );
  }
}

