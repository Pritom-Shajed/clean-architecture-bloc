import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server(String message) = _ServerFailure;
  const factory Failure.network(String message) = _NetworkFailure;
  const factory Failure.local(String message) = _LocalFailure;
}
