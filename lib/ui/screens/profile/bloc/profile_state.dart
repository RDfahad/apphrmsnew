import 'dart:io';

class ProfileState {
  final bool touchId;
  final File? image;
  final bool isLoading;

  ProfileState(
      {required this.touchId, required this.image, required this.isLoading});

  factory ProfileState.init() =>
      ProfileState(touchId: false, image: null, isLoading: false);
  ProfileState copyWith({bool? touchId, File? image, bool? isLoading}) {
    return ProfileState(
      touchId: touchId ?? this.touchId,
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
