part of 'main.dart';

class LocalSaving extends StatefulWidget {
  @override
  _LocalSavingState createState() => _LocalSavingState();
}

class _LocalSavingState extends State<LocalSaving> {
  String username;
  final _userKey = GlobalKey<FormState>();

  //Find the local path:
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

//Create a reference to the file location:
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/profile.txt');
  }

//Write data to that file:
  Future<File> writeContent() async {
    final file = await _localFile;
    return file.writeAsString('$username');
  }

//Read data from the file:
  Future<String> readContent() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'Error';
    }
  }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent().then((String value) {
      setState(() {
        username = value;
      });
    });
  }

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
        padding: const EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.00),
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
                  key: _userKey,
                  child: Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "What is your name?",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          username = value;
                          return null;
                        }),
                  ),
                ),
              ],
            ),
            RaisedButton(
                onPressed: () {
                  if (_userKey.currentState.validate()) {
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
    );
  }
}
