
import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/extensions/exception_extension.dart';
import 'package:flutter_app_template/features/quiz/repositories/quiz_api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/utils/logger.dart';
import '../entities/quiz.dart';
part 'quiz_api_repository.g.dart';

@Riverpod(keepAlive: true)
QuizApiRepository quizApiRepository(QuizApiRepositoryRef ref) {
  return QuizApiRepository(ref);
}

class QuizApiRepository {
  QuizApiRepository(
      Ref ref,
      ) : _client = ref.read(quizApiClientProvider);

  final QuizApiClient _client;

  Future<Quiz> createQuiz() async {
    try {
      final result = await _client.createQuiz('');
      return result.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } on DioException catch (e) {
      final response = e.response;
      logger.shout(
        'statusCode: ${response?.statusCode}, '
            'message: ${response?.statusMessage}',
      );
      throw AppException.error(e.message ?? 'error');
    } on Exception catch (e) {
      logger.shout(e);
      throw AppException.error(e.errorMessage);
    }
  }
}
