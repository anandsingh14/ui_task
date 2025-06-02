
class StrollState {
  final String selectedOption;

  StrollState({required this.selectedOption});

  StrollState copyWith({String? selectedOption}) {
    return StrollState(
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}
