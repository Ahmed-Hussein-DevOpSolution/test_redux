import 'package:flutter/material.dart';
import 'package:test_redux/features/auth/models/logged_user_model.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isInternetConnected;
  final LoggedUser? loggedUser;

  const AppState({
    this.isLoading = false,
    this.isInternetConnected = false,
    this.loggedUser,
  });

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith({
    required bool? isLoading,
    required bool? isInternetConnected,
    required LoggedUser? loggedUser,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      isInternetConnected: isInternetConnected ?? this.isInternetConnected,
      loggedUser: loggedUser ?? this.loggedUser,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^ loggedUser.hashCode ^ isInternetConnected.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isInternetConnected == other.isInternetConnected &&
          loggedUser == other.loggedUser;

  @override
  String toString() {
    return 'AppState{\nisLoading: $isLoading,\nisInternetConnected: $isInternetConnected\nloggedUser: $loggedUser,\n}';
  }
}
