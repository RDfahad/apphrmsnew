import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/detail/cubit/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
}
