import 'package:auth/src/core/base/network/failure/failure.dart';
import 'package:dartz/dartz.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef JSON = Map<String, dynamic>;
typedef QueryParams = Map<String, String>;
