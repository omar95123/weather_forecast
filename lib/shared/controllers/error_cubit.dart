import 'package:flutter_bloc/flutter_bloc.dart';

/// App-wide error channel, used to surface a global snack bar/toast from
/// anywhere without threading a BuildContext through the repositories.
class ErrorCubit extends Cubit<String?> {
  ErrorCubit() : super(null);

  void show(String message) => emit(message);

  void clear() => emit(null);
}
