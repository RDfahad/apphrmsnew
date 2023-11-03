class RequestOverviewState {
  final List<bool> isCheckheight;

  RequestOverviewState({required this.isCheckheight});

  factory RequestOverviewState.init() => RequestOverviewState(isCheckheight: [false, false, false]);

  RequestOverviewState copyWit({List<bool>? isCheckheight}) {
    return RequestOverviewState(isCheckheight: isCheckheight ?? this.isCheckheight);
  }
}
