class Loan {
  String documentID;
  String amount;
  String peroid;
  String frequency;
  String interestRate;
  String bodabodaDocumentID;
  String created;
  String updated;
  String userDocumentID;
  String loanTypeID;

  Loan({
      this.documentID,
      this.amount,
      this.peroid,
      this.frequency,
      this.interestRate,
      this.bodabodaDocumentID,
      this.created,
      this.updated,
      this.userDocumentID,
      this.loanTypeID
  });

  static Loan createLoanFromDocument(dynamic document) {
    return Loan(
      documentID: document['documentID'],
      amount: document['amount'],
      peroid: document['period'],
      frequency: document['frequency'],
      interestRate: document['interestRate'],
      bodabodaDocumentID: document['bodabodaDocumentID'],
      created: document['created'],
      updated: document['updated'],
      userDocumentID: document['userDocumentID'],
      loanTypeID: document['loanTypeID']
    );
  }
}
