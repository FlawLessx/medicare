import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/blocs/_index.dart';

List initBlocProvider() {
  return [
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
    ),
  ];
}
