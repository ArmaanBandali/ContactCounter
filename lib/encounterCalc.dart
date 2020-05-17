part of 'main.dart';

class UserList {
  UserList(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.fullName = firstName + '_' + lastName;
    this.primaryContacts = List();
    this.secondaryContacts = List();
  }

  String firstName;
  String lastName;
  String fullName;
  List<String> primaryContacts;
  List<String> secondaryContacts;


  void retrieveFirstContacts() {
    Firestore.instance.collection('User').document(fullName).collection(
        'closeEncounters').getDocuments().then((value) {
      print(fullName);
      value.documents.forEach((result) {
        primaryContacts.add(result.data["name"]);
        print(result.data["name"]);
        print(primaryContacts);
      });
      primaryContacts.removeWhere((value) => value == null);
      print(primaryContacts);
    });
  }

  List<String> retrieveSecondaryContacts() {
    print(primaryContacts);
    primaryContacts.forEach((element) {
      Firestore.instance.collection('User').document(element).collection(
          'closeEncounters').getDocuments().then((value) {
        value.documents.forEach((result) {
          secondaryContacts.add(result.data["name"]);
          print(result.data["name"]);
        });
      });
      secondaryContacts.removeWhere((value) => value == null);
      print(secondaryContacts);
      return secondaryContacts;
    });
  }

  List<String> eliminateDuplicates(List<String> contactList) {

  }

  void writeNewContact() {
    String encounterName = retrieveEncounterInfo();
    Firestore.instance.collection('User').document(fullName).collection(
        'closeEncounters')
        .add({'name': encounterName});
  }

  /*void updateContacts(){
    String encounterName = retrieveEncounterInfo();
    DateTime encounterDate = retrieveDate();
    Firestore.instance
        .collection('user')
        .where("firstName", isEqualto: encounterName[0])
  }*/

  int contactCalculation() {

  }

  String retrieveEncounterInfo() {
//Return User entered in encounter info
    String fname = _EncountersFormState.first_name;
    String lname = _EncountersFormState.last_name;

    return fname + '_' + lname;
  }

  DateTime retrieveDate() {
    return DateTime.now();
  }


}