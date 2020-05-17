part of 'main.dart';

class LocalSaving extends StatefulWidget {
  @override
  _LocalSavingState createState() => _LocalSavingState();
}

class _LocalSavingState extends State<LocalSaving> {
  static String ufname;
  static String ulname;
  final _firstKey = GlobalKey<FormState>();
  final _lastKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Contact Counter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.00),
        child: SingleChildScrollView( //fix error for overflow when keyboard comes up
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/person.png'),
                backgroundColor: Colors.green.shade200,
                radius: 75.0,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.person),
                  SizedBox(
                    width: 15.0,
                  ),
                  Form(
                    key: _firstKey,
                    child: Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "What is your first name?",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            ufname = value;
                            return null;
                          }),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.person),
                  SizedBox(
                    width: 15.0,
                  ),
                  Form(
                    key: _lastKey,
                    child: Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "What is your last name?",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            ulname = value;
                            return null;
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  onPressed: () {
                    if (_firstKey.currentState.validate() && _lastKey.currentState.validate()) {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactCounter()),
                      );
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
