
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goalify/features/auth/data/models/user_model.dart';


part 'auth_state_state.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AuthInitial());
}
