class Loan {
  String documentID;
  String amount;
  String period;
  String frequency;
  String interestRate;
  String bodabodaDocumentID;
  String created;
  String updated;
  String userDocumentID;
  String loanTypeID;
  String paymentPeriod;
  String item;
  String quantity;

  Loan({
      this.documentID,
      this.amount,
      this.period,
      this.frequency,
      this.interestRate,
      this.bodabodaDocumentID,
      this.created,
      this.updated,
      this.userDocumentID,
      this.loanTypeID,
      this.paymentPeriod,
      this.item,
      this.quantity,
  });

  static Loan createLoanFromDocument(dynamic document) {
    return Loan(
      documentID: document['documentID'],
      amount: document['amount'],
      period: document['period'],
      frequency: document['frequency'],
      interestRate: document['interestRate'],
      bodabodaDocumentID: document['bodabodaDocumentID'],
      created: document['created'],
      updated: document['updated'],
      userDocumentID: document['userDocumentID'],
      loanTypeID: document['loanTypeID'],
      paymentPeriod: document['paymentPeriod'],
      item: document['item'],
      quantity: document['quantity']
    );
  }

  static createDocumentFromLoan(Loan loan) {
    return {
      'amount': loan.amount,
      'period': loan.period,
      'frequency': loan.frequency,
      'interestRate': loan.interestRate,
      'bodabodaDocumentID': loan.bodabodaDocumentID,
      'created': loan.created,
      'updated': loan.updated,
      'userDocumentID': loan.userDocumentID,
      'loanTypeID': loan.loanTypeID,
      'paymentPeriod': loan.paymentPeriod,
      'item': loan.item,
      'quantity': loan.quantity,
    };
  }

  @override
  String toString() {
    return 'Loan{documentID: $documentID, amount: $amount, period: $period, frequency: $frequency, interestRate: $interestRate, bodabodaDocumentID: $bodabodaDocumentID, created: $created, updated: $updated, userDocumentID: $userDocumentID, loanTypeID: $loanTypeID, paymentPeriod: $paymentPeriod, item: $item, quantity: $quantity}';
  }

}
