import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/widgets.dart';
part 'encounters.dart';
part 'results.dart';
=======
import 'login_page.dart';
>>>>>>> LogingPage

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
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Image.asset('images/radar.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Encounters()),
                    );
                  },
                  child: Text(
                    'ENCOUNTERS',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'SourceCodePro',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  color: Colors.blue.shade700,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Results()),
                    );
                  },
                  child: Text(
                    'RESULTS',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'SourceCodePro',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Contact Counter'),
        centerTitle: true,
      ),
      body: HomePage(),
=======
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
>>>>>>> LogingPage
    );
  }
}
