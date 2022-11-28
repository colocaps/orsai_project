import 'package:core/core.dart';

class GetTokenRemoteRepositoryOutPut {
  final TokenEntity? data;
  final List<String>? errors;

  GetTokenRemoteRepositoryOutPut({
    this.errors,
    this.data,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
