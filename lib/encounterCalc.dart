part of 'main.dart';

class UserList{
  UserList(String firstName, String lastName){
    this.firstName = firstName;
    this.lastName = lastName;
    this.fullName = firstName+'_'+lastName;
  }

  String firstName;
  String lastName;
  String fullName;

  List<String> retrieveFirstContacts(){
    var firstContacts = ['hello','world'];

  }

  List<String> retrieveSecondaryContacts(List<String> primaryContacts){

  }

  List<String> eliminateDuplicates(List<String> contactList){

  }

  void writeNewContact() {
    String encounterName = retrieveEncounterInfo();
    DateTime encounterDate = retrieveDate();
    Firestore.instance.collection('user').document(fullName)
        .setData({'fullName': encounterName, 'date': encounterDate});
  }

  /*void updateContacts(){
    String encounterName = retrieveEncounterInfo();
    DateTime encounterDate = retrieveDate();
    Firestore.instance
        .collection('user')
        .where("firstName", isEqualto: encounterName[0])
  }*/

  int contactCalculation(){

  }

  String retrieveEncounterInfo(){

  }

  DateTime retrieveDate(){

  }



}