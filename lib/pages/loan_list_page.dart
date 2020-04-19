import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc_provider.dart';
import 'package:kazendemotors/blocs/loan_list/loan_list.bloc_provider.dart';
import 'package:kazendemotors/blocs/loan_list/loan_list_bloc.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/models/loan/loan_model.dart';
import 'package:kazendemotors/pages/loan_application_page.dart';
import 'package:kazendemotors/services/loan/loan_service.dart';
import 'package:kazendemotors/widget/list_view_tile_widget.dart';

/// *******************************************************************
/// This is the loan list page, user comes here after clicking loan icon
/// from the bodaboda card widget passing in the bodaboda document id

class LoanListPage extends StatefulWidget {
  String bodabodaDocumentID;
  LoanListPage({ Key key, this.bodabodaDocumentID }): super(key: key);
  @override
  _LoanListPageState createState() => _LoanListPageState();
}

class _LoanListPageState extends State<LoanListPage> {
  LoanListBloc _loanListBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loanListBloc = LoanListBlocProvider.of(context).loanListBloc;
  }


  @override
  void dispose() {
    _loanListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan List'),),
      body: StreamBuilder(
        stream: _loanListBloc.loanStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListViewTileWidget(snapshot: snapshot,);
          } else return Center(
            child: Text('No Loan History to Show'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => LoanApplicationBlocProvider(
              child: LoanApplicationPage(),
              loanApplicationBloc: LoanApplicationBloc(
                loanApi: LoanService(),
                bodaBodaDocumentID: widget.bodabodaDocumentID,
                authenticationApi: AuthenticationService(),
                apply: true,
                loan: Loan()
              ),
            )
          ));
        },
      ),
    );
  }
}
