import 'package:flutter/material.dart';
part 'encounters.dart';

void main() => runApp(
      MaterialApp(
        home: ContactCounter(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Encounters()),);
            },
            child: Text('Encounters'),
          ),
        ),
      ],
    );
  }
}

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Contact Counter'),
        centerTitle: true,
      ),
      body: HomePage(),
    );
  }
}
