import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firefly/models/notificationList.dart';
import 'package:flutter/cupertino.dart';
part 'fly_event.dart';
part 'fly_state.dart';

class FlyBloc extends Bloc<FlyEvent, FlyState> {
  FlyBloc() : super(FlyState());

    @override
    Stream<FlyState> mapEventToState(
      FlyEvent event,
    ) async* {
      if (event is ChangeFireStatus) {
        yield _mapChangeFireStatusToState(event, state);
      }
    }

    FlyState _mapChangeFireStatusToState(
      ChangeFireStatus event,
      FlyState state,
    ) {
      return state.copyWith(fireDetected: event.status);
    }

    FlyState _mapAddNotificationToState(
      AddNotification event,
      FlyState state,
    ) {
      return state.copyWith( );
    }
  }
