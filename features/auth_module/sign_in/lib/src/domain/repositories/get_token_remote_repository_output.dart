import 'package:sign_in/src/domain/entities/token_entity.dart';

class GetTokenRemoteRepositoryOutPut {
  final TokenEntity? data;
  final List<String>? errors;

  GetTokenRemoteRepositoryOutPut({
    this.errors,
    this.data,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
