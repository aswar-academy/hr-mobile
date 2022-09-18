import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  

  ProfileCubit(
    ): super(const ProfileState.idle());


  
}
