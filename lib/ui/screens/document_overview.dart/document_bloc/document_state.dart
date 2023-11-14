import 'package:flutter/material.dart';
import '../../../../domain/entities/document_management/employee_document.dart';
import '/domain/entities/attendance/attendance_records.dart';

class DocumentState {
  final bool isLoading;
  final DocumentData documentData;

  DocumentState({
    required this.isLoading,
    required this.documentData,
  });

  factory DocumentState.init() => DocumentState(isLoading: false,documentData: DocumentData());

  DocumentState copyWith({
    bool? isLoading,
    DocumentData? documentData
  }) {
    return DocumentState(
      isLoading: isLoading ?? this.isLoading,
      documentData: documentData ?? this.documentData,
    );
  }
}
