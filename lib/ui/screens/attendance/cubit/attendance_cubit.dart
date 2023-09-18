import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
}
