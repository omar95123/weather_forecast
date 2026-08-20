import 'package:flutter_bloc/flutter_bloc.dart';

/// App-wide loading flag, used for global overlays that don't belong to a
/// single feature (e.g. a full-screen spinner while bootstrapping).
class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void show() => emit(true);

  void hide() => emit(false);
}
