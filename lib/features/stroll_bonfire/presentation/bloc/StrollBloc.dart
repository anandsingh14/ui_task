import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollEvent.dart';


class StrollBloc extends Bloc<StrollEvent, String?> {
  StrollBloc() : super(null) {
    on<SelectOptionEvent>((event, emit) {
      emit(event.option);
    });
  }
}

