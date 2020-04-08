class BodaBoda {
  String documentID;
  String firstName;
  String lastName;
  String middleName;
  String dateOfBirth;
  String permitNumber;
  String created;
  String updated;
  String userId;
  String stageID;
  String locationID;
  String motorcycleID;

  BodaBoda({
    this.documentID,
    this.firstName,
    this.lastName,
    this.middleName,
    this.dateOfBirth,
    this.permitNumber,
    this.created,
    this.updated,
    this.userId,
    this.stageID,
    this.locationID,
    this.motorcycleID
  });

  factory BodaBoda.createBodaBodaFromDocument(dynamic doc) =>
  BodaBoda(
    documentID: doc.documentID,
    firstName: doc['firstName'],
    lastName: doc['lastName'],
    middleName: doc['middleName'],
    dateOfBirth: doc['dateOfBirth'],
    permitNumber: doc['permitNumber'],
    created: doc['created'],
    updated: doc['updated'],
    userId: doc['userID'],
    stageID: doc['stageID'],
    locationID: doc['locationID'],
    motorcycleID: doc['motorcycleID']
  );

  static createDocumentFromBodaBoda(BodaBoda bodaBoda) {
    return {
      'firstName': bodaBoda.firstName,
      'lastName': bodaBoda.lastName,
      'middleName': bodaBoda.middleName,
      'dateOfBirth': bodaBoda.dateOfBirth,
      'permitNumber': bodaBoda.permitNumber,
      'created': bodaBoda.created,
      'updated': bodaBoda.updated,
      'userID': bodaBoda.userId,
      'stageID': bodaBoda.stageID,
      'locationID': bodaBoda.locationID,
      'motorcycleID': bodaBoda.motorcycleID
    };
  }
}