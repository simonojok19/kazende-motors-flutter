class LoanType {
  String documentID;
  String name;
  String paymentPeriod;
  String item;
  String quantity;
  String description;
  String created;
  String updated;
  String userID;

  LoanType({
    this.documentID,
    this.name,
    this.paymentPeriod,
    this.item,
    this.quantity,
    this.description,
    this.created,
    this.updated,
    this.userID
  });

  factory LoanType.createLoanTypeFromDoc(dynamic doc) => LoanType(
      documentID: doc['documentID'],
      name: doc['name'],
      item: doc['item'],
      quantity: doc['quantity'],
      description: doc['description'],
      created: doc['created'],
      updated: doc['updated'],
      userID: doc['userID']
  );

  static createDocumentFromLoanType(LoanType loanType) {
    return {
      'name': loanType.name,
      'item': loanType.item,
      'quantity': loanType.quantity,
      'description': loanType.description,
      'created': loanType.created,
      'updated': loanType.updated,
      'userID': loanType.userID
    };
  }
}