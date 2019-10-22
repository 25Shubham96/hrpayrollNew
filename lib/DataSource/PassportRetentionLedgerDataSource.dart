import 'package:flutter/material.dart';
import 'package:hrpayroll/response_model/PassportRetentionLedgerResponse.dart';

class PassportRetentionLedgerDataSource extends DataTableSource {

  List<PassportRetentionLedgerModel> data = new List();

  PassportRetentionLedgerDataSource(this.data);

  int selectedCount = 0;

  @override
  DataRow getRow(int index) {
    PassportRetentionLedgerModel passportRetentionLedgerModel = data[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell> [
        DataCell(Text(passportRetentionLedgerModel.dateOfReceipt)),
        DataCell(Text(passportRetentionLedgerModel.transactionId)),
        DataCell(Text(passportRetentionLedgerModel.requestType)),
        DataCell(Text(passportRetentionLedgerModel.employeeId)),
        DataCell(Text(passportRetentionLedgerModel.employeeName)),
        DataCell(Text(passportRetentionLedgerModel.passportNo)),
        DataCell(Text(passportRetentionLedgerModel.receivingEmployeeId)),
        DataCell(Text(passportRetentionLedgerModel.receivingEmployeeName)),
        DataCell(Text(passportRetentionLedgerModel.column1)),
        DataCell(Text(passportRetentionLedgerModel.commentRemarks)),
        DataCell(Text(passportRetentionLedgerModel.transactionType)),
        DataCell(Checkbox(
            value: passportRetentionLedgerModel.obtained == 1 ? true : false,
            onChanged: null)),
        DataCell(Checkbox(
            value: passportRetentionLedgerModel.released == 1 ? true : false,
            onChanged: null)),
        DataCell(Text(passportRetentionLedgerModel.expectedReceiptDate)),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => selectedCount;

}