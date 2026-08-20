import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/logger.dart';

part 'application_state.dart';

/// Bootstraps app-wide, non-UI setup (cache warm-up, connectivity checks,
/// feature flags, etc). Kept as its own Cubit so `main.dart` has a single
/// "is the app ready" signal to key off of.
class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial());

  Future<void> setupApplication() async {
    Logger.logInfo('Setting up application...', tag: 'Application');
    emit(ApplicationReady());
  }
}
