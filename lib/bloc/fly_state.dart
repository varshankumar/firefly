part of 'fly_bloc.dart';

class FlyState extends Equatable {
  final  bool fireDetected;
   final NotificationList notifications;

   FlyState({
    this.fireDetected = false,
    this.notifications= const NotificationList(list: []),
  });

  FlyState copyWith({
    bool? fireDetected,
  }) {
    return FlyState(
      fireDetected: fireDetected ?? this.fireDetected,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props => [fireDetected, notifications];

  @override
  bool get stringify => true;
}
