part of 'main.dart';

class Encounters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Contact Counter - Encounter'),
        centerTitle: true,
      ),
      body: EncountersForm(),
    );
  }
}
class Levels {
  int id;
  String name;

  Levels(this.id, this.name);
  static List<Levels> getLevels() {
    return<Levels> [
      Levels(1,'Less than 1 meter'),
      Levels(2,'Less than 2 meters'),
      Levels(3,'Less than 5 meters')
    ];
  }
}


class EncountersForm extends StatefulWidget {
  @override
  _EncountersFormState createState() => _EncountersFormState();
}

class _EncountersFormState extends State<EncountersForm> {

  List<Levels> _levels = Levels.getLevels();
  List<DropdownMenuItem<Levels>> _dropdownMenuItems;
  Levels _selectedLevel;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_levels);
    _selectedLevel = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Levels>> buildDropdownMenuItems(List level) {
    List<DropdownMenuItem<Levels>> items = List();
    for (Levels level in level) {
      items.add(
        DropdownMenuItem(
          value: level,
          child: Text(level.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Levels selectedLevel) {
    setState(() {
      _selectedLevel = selectedLevel;
    });
  }

  var choice;
  var choices = [1,2,3];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Person you encountered",
              icon: Icon(Icons.person)
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a person';
              }
              return null;
            }
          ),
//          TextFormField(
//            validator: (value) {
//              if (value.isEmpty){
//                return 'Please enter a date';
//              }
//              return null;
//            }
//          ),
          DropdownButton(
            value: _selectedLevel,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),

          RaisedButton(
            onPressed: (){
              if (_formKey.currentState.validate()){
              }
            },
            child: Text('Submit')
          )

//          InputDatePickerFormField(
//            key:_formKey,
//            firstDate: DateTime(2020),
//            lastDate: DateTime(2021),
//
//          )
        ],
      )
    );
  }
}






//class Form extends StatefulWidget {
//  @override
//  _FormState createState() => _FormState();
//}
//
//class _FormState extends State<Form> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//        child: Column(
//          children: <Widget>[
//            TextField(
//
//            ),
//            TextField(
//
//            )
//          ]
//        )
//    );
//  }
//}
//
