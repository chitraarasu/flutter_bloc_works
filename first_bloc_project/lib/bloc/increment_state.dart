class IncrementState {
  final int counter;

  IncrementState({this.counter = 0});

  IncrementState copyWith({int? counter}) {
    return IncrementState(
      counter: counter ?? this.counter,
    );
  }
}
