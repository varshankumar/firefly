part of 'fly_bloc.dart';

abstract class FlyEvent extends Equatable {
  const FlyEvent();
  @override
  List<Object> get props => [];
}

class ChangeFireStatus extends FlyEvent {
  final bool status;

  const ChangeFireStatus(this.status);

  @override
  List<Object> get props => [status];
}

class AddNotification extends FlyEvent {
  final Notification notification;

  const AddNotification(this.notification);

  @override
  List<Object> get props => [notification];
}
