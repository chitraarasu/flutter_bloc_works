import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  /// Bloc will emit data only there is changes on data. If same data emitted multiple times UI will not update.
  /// The comparison between two object is based on the props in the bottom list. if some props missing on the list. UI will not update for value changes.

  @override
  List<Object> get props => [
    emailNotifications,
    appNotifications,
  ];
}
