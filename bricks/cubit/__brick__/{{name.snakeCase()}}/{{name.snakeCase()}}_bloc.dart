import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto/data/error_handler/result_state.dart';


typedef {{name.pascalCase()}}State = ResultState<{{{state_type}}}>;

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{#repositories}}final {{{..pascalCase()}}}Repository _{{{..camelCase()}}}Repository;
  {{/repositories}}

  {{name.pascalCase()}}Cubit(
    {{#repositories}}this._{{..camelCase()}}Repository,
    {{/repositories}}): super(const {{name.pascalCase()}}State.idle());


  {{#template}}
  Future<void> getData(dynamic data) =>
      _repositoryRepository.getData(data).listen(emit).asFuture();
  {{/template}}
}
