import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/service_locator.dart';

class ResetPasswordUsecase extends UseCases<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<AuthenticationRepository>()
        .resetPassword(email: params!);
  }
}
