import 'package:compound/auth/form_submission_status.dart';
import 'package:flutter/material.dart';

class MonthlyState {
  final FormSubmissionStatus formSubmissionStatus;
  final List colors = [Color(0xFFBCDDFF), Color(0xFFFFB8B8), Color(0xFFFFDEA0), Color(0xFF5976FF)];
  final List<Map<String, String>> upcomingPayments = [
    {
      'title': 'House Rent',
      'time': 'Tomorow',
    },
    {
      'title': 'Credit Installments',
      'time': 'Tomorow',
    },
    {
      'title': 'TNB bills',
      'time': 'Tomorow',
    },
    {
      'title': 'House Rent',
      'time': 'Tomorow',
    }
  ];

  final List<Map<String, dynamic>> budgets = [
    {
      'title': 'Rental',
      'percentage': 0.5,
    },
    {
      'title': 'Vacation',
      'percentage': 0.3,
    },
    {
      'title': 'Food',
      'percentage': 0.2,
    },
    {
      'title': 'Study Material',
      'percentage': 0.9,
    }
  ];

  MonthlyState({
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  MonthlyState copywith({
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return MonthlyState(
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
