// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? token;
  final String? shopeId;
  final String? userName;
  final String? error;

  const AuthState({
    required this.status,
    this.token,
    this.shopeId,
    this.userName,
    this.error,
  });

  factory AuthState.initial() => const AuthState(status: AuthStatus.initial);

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    String? shopeId,
    String? userName,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      shopeId: shopeId ?? this.shopeId,
      userName: userName ?? this.userName,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, token, shopeId, userName, error];
}
