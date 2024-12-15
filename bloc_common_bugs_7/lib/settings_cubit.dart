import 'package:bloc/bloc.dart';

import 'cubit_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
    SettingsState(
      appNotifications: false,
      emailNotifications: false,
    ),
  );

  void toggleAppNotifications(bool newValue) {
    /// You should never mutate existing state. To update UI need to emit new object.
    // state.appNotifications = false;
    // emit(state);

    /// Bloc will emit data only there is changes on data. If same data emitted multiple times UI will not update.
    /// The comparison between two object is based on equatable package check cubit_state.dart file.

    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
