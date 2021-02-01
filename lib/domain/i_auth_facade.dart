import 'package:dartz/dartz.dart';
import 'package:rhacafe_business/domain/auth_failure.dart';

abstract class IAuthFacade{
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

}