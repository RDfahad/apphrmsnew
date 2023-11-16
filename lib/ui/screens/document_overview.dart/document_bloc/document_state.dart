import 'package:flutter/material.dart';
import '../../../../domain/entities/document_management/employee_document.dart';
import '/domain/entities/attendance/attendance_records.dart';

class DocumentState {
  final bool isLoading;
  final double? downloadProgress;
  final DocumentData documentData;

  DocumentState({
    required this.isLoading,
    required this.documentData,
    required this.downloadProgress,
  });

  factory DocumentState.init() =>
      DocumentState(isLoading: false, documentData: DocumentData(), downloadProgress: null);

  DocumentState copyWith({bool? isLoading, DocumentData? documentData, double? downloadProgress}) {
    return DocumentState(
      isLoading: isLoading ?? this.isLoading,
      documentData: documentData ?? this.documentData,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }
}
