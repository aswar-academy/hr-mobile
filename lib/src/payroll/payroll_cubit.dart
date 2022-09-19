import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'payroll_state.dart';

@injectable
class PayrollCubit extends Cubit<PayrollState> {
  

  PayrollCubit(
    ): super(const PayrollState.idle());


  
}
