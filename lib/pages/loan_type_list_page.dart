import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/pages/loan_type_edit_page.dart';
import 'package:kazendemotors/services/loan_type/loan_type_service.dart';

class LoanTypeListPage extends StatefulWidget {
  @override
  _LoanTypeListPageState createState() => _LoanTypeListPageState();
}

class _LoanTypeListPageState extends State<LoanTypeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan Types'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => LoanTypeEditBlocProvider(
              child: LoanTypeEditPage(),
              authenticationApi: AuthenticationService(),
              loanTypeApi: LoanTypeService(),
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
