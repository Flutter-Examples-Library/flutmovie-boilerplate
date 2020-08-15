import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

@lazySingleton
class GetLocalMovieList implements UseCase<List<MovieEntity>, NoParams> {
  Repository repository;

  GetLocalMovieList({@required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getLocalMovieList();
  }
}
