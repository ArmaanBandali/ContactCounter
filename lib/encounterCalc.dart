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
    Firestore.instance.collection('User').document(fullName).collection('closeEncounters').getDocuments().then((value){
      print(fullName);
      List <String> fullname_List = List();
      value.documents.forEach((result){
        fullname_List.add(result.data["name"]);
        print(result.data["name"]);
        print(fullname_List);
      });
      fullname_List.removeWhere((value) => value == null);
      print(fullname_List);
      return fullname_List;
    });
  }

  List<String> retrieveSecondaryContacts(List<String> primaryContacts){
    List <String> fullname_List = List();
    print(primaryContacts);
    primaryContacts.forEach((element) {
      Firestore.instance.collection('User').document(element).collection('closeEncounters').getDocuments().then((value){
        value.documents.forEach((result){
          fullname_List.add(result.data["name"]);
          print(result.data["name"]);
        });
      });
      fullname_List.removeWhere((value) => value == null);
      print(fullname_List);
      return fullname_List;
    });

  }

  List<String> eliminateDuplicates(List<String> contactList){

  }

  void writeNewContact() {
    String encounterName = retrieveEncounterInfo();
    Firestore.instance.collection('User').document(fullName).collection('closeEncounters')
        .add({'name': encounterName});
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
//Return User entered in encounter info
    String fname = _EncountersFormState.first_name;
    String lname = _EncountersFormState.last_name;

    return fname + '_' + lname;
  }

  DateTime retrieveDate(){

    return DateTime.now();

  }



}