import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc_provider.dart';
import 'package:kazendemotors/blocs/loan_list/loan_list.bloc_provider.dart';
import 'package:kazendemotors/blocs/loan_list/loan_list_bloc.dart';
import 'package:kazendemotors/services/loan/loan_service.dart';
import 'package:kazendemotors/widget/list_view_tile_widget.dart';

class LoanListPage extends StatefulWidget {
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
              child: ,
            )
          ));
        },
      ),
    );
  }
}
