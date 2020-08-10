import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class ClearLocalMovieList implements UseCase<bool, NoParams> {
  Repository repository;

  ClearLocalMovieList({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.clearLocalMovieList();
  }
}