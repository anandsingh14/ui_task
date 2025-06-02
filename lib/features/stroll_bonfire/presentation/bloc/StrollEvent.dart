import 'package:equatable/equatable.dart';

abstract class StrollEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectOptionEvent extends StrollEvent {
  final String option;

  SelectOptionEvent(this.option);

  @override
  List<Object?> get props => [option];
}
