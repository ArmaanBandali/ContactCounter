part of 'main.dart';

class Results extends StatelessWidget {
  String stringz = ContactCounter.USER.retrieveSecondaryContacts(ContactCounter.USER.retrieveFirstContacts()).toString();
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
            '$stringz'

        )
      ),
    );
  }
}