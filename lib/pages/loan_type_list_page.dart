import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc_provider.dart';
import 'package:kazendemotors/blocs/type_list/loan_type_list_bloc.dart';
import 'package:kazendemotors/blocs/type_list/loan_type_list_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/pages/loan_type_edit_page.dart';
import 'package:kazendemotors/services/loan_type/loan_type_service.dart';

class LoanTypeListPage extends StatefulWidget {
  @override
  _LoanTypeListPageState createState() => _LoanTypeListPageState();
}

class _LoanTypeListPageState extends State<LoanTypeListPage> {
  LoanTypeListBloc _loanTypeListBloc;
  AuthenticationBloc _authenticationBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loanTypeListBloc = LoanTypeListBlocProvider.of(context).loanTypeListBloc;
  }


  @override
  void dispose() {
    _loanTypeListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan Types'),),
      body: StreamBuilder(
        stream: _loanTypeListBloc.loanTypeList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if ( snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return _buildListViewSeparated(snapshot);
          } else {
            return Center(
              child: Text('Add Loan Types'),
            )
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => LoanTypeEditBlocProvider(
              child: LoanTypeEditPage(),
              loanTypeEditBloc: LoanTypeEditBloc(
                add: true,
                authenticationApi: AuthenticationService(),
                loanType: LoanType(),
                loanTypeApi: LoanTypeService()
              ),
            )
          )
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
