

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/features/quiz/entities/quiz.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/repositories/dio/auth_header_interceptor.dart';
import '../../../core/repositories/dio/constants.dart';
part 'quiz_api_client.g.dart';

@Riverpod(keepAlive: true)
QuizApiClient quizApiClient(QuizApiClientRef ref) {
  return QuizApiClient(
    Dio(dioDefaultOptions)
      ..interceptors.addAll(
        [
          if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
          authHeaderInterceptor,
        ],
      ),
    baseUrl: 'https://quiz-app-lzoo5udtua-dt.a.run.app',
  );
}

@RestApi()
abstract class QuizApiClient {
  factory QuizApiClient(
      Dio dio, {
        String baseUrl,
      }) = _QuizApiClient;
  @GET('/generate_quiz')
  Future<Quiz> createQuiz(
      @Query('user_id') String userId,// TODO(yskuem): カスタムクイズの機能を追加した時はuserIdを引数に追加する
  );
}
