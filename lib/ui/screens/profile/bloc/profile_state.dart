class ProfileState{
  final bool touchId;
  ProfileState({required this.touchId});

  factory ProfileState.init() => ProfileState(touchId: false);
  ProfileState copyWith({
    bool? touchId
}){
    return ProfileState(
      touchId: touchId ?? this.touchId
    );
  }
}