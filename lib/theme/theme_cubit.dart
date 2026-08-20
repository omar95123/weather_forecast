import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme.dart';
import 'theme_model.dart';

class ThemeCubit extends Cubit<ThemeModel> {
  ThemeCubit() : super(AppTheme.light);

  void toggle() => emit(state.isDark ? AppTheme.light : AppTheme.dark);

  void setDark(bool isDark) => emit(isDark ? AppTheme.dark : AppTheme.light);
}
