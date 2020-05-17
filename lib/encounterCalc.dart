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
    List <String> fullname_List;

    Firestore.instance.collection('User').document(fullName).collection('closeCounters').getDocuments().then((value){
      value.documents.forEach((result){

        fullname_List = result.data["name"];
        print(result.data["name"]);
        print(fullname_List);

      });




    });



  }

  List<String> retrieveSecondaryContacts(List<String> primaryContacts){

  }

  List<String> eliminateDuplicates(List<String> contactList){

  }

  void writeNewContact() {
    String encounterName = retrieveEncounterInfo();
    DateTime encounterDate = retrieveDate();
    Firestore.instance.collection('user').document(fullName)
        .setData({'name': "WORK PLEASE", 'date': "DC"});
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