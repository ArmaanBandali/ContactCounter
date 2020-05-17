part of 'main.dart';

class Results extends StatelessWidget {
  UserList test= UserList("Test","User");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Contact Counter - Results'),
        centerTitle: true,
      ),
      body: Container(
        child: Text(
            test.retrieveFirstContacts().toString()

        )
      ),
    );
  }
}