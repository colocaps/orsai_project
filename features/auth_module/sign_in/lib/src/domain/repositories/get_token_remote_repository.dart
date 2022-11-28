import 'package:sign_in/src/domain/repositories/get_token_remote_repository_output.dart';

abstract class GetTokenRemoteRepository {
  Future<GetTokenRemoteRepositoryOutPut> getToken();
}
