import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/repository/document_management/document_management_repo.dart';
import '../../../../data/http/exception_handler.dart';
import 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  final DocumentManagementRepo documentManagementRepo;

  DocumentCubit(this.documentManagementRepo) : super(DocumentState.init());

  initState() {
    emit(DocumentState.init());
  }

  updateValue(double value) {
    emit(state.copyWith(downloadProgress: value));
  }

  getDocument() async {
    emit(state.copyWith(isLoading: true));
    await documentManagementRepo.getDocument().then((documentRes) {
      emit(state.copyWith(isLoading: false, documentData: documentRes.documentData));
      log("documentRes.documentData ${documentRes.documentData}");
    }, onError: (e) {
      ExceptionHandler().handleException(e);
      emit(state.copyWith(isLoading: false));
    });
  }
}
////////////////////////////////////////////////////////////////////////////////
