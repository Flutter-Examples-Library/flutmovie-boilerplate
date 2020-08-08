import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../entities/user_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class GetAuthenticatedUser implements UseCase<UserEntity, NoParams> {
  Repository repository;

  GetAuthenticatedUser(
      {@required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) async {
    final tokenResult = await this.repository.getToken();

    return tokenResult.fold<Future<Either<Failure, UserEntity>>>(
        (failure) => Future.value(Left(failure)),
        (token) async => await repository.getByToken(token));
  }
}