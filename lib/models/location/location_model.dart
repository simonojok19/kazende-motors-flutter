class Location {
  String documentID;
  String district;
  String subCounty;
  String village;
  String created;
  String updated;
  String userID;

  Location({
    this.documentID,
    this.district,
    this.subCounty,
    this.village,
    this.created,
    this.updated,
    this.userID
  });

  factory Location.createLocationFromDocument(dynamic doc) => Location(
    documentID: doc.documentID,
    district: doc['district'],
    subCounty: doc['subCounty'],
    village: doc['village'],
    created: doc['created'],
    updated: doc['updated'],
    userID: doc['userID']
  );

  static dynamic createDocumentFromLocation(Location location) {
    return {
      'district': location.district,
      'subCounty': location.subCounty,
      'village': location.village,
      'created': location.created,
      'updated': location.updated,
      'userID': location.userID
    };
  }

  String toString() {
    return 
    ''' Location(
      'documentID': $documentID,
      'subCounty': $subCounty,
      'village':  $village,
      'created': $created,
      'updated': $updated,
      'userID': $userID
    )
    ''';
  }
}