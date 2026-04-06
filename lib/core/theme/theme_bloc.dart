import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketa_admin/core/database/cache_helper.dart';

// ─── Events ───────────────────────────────────────────────────────────────────

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object?> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}

class SetThemeEvent extends ThemeEvent {
  final bool isDark;
  const SetThemeEvent(this.isDark);
  @override
  List<Object?> get props => [isDark];
}

// ─── State ────────────────────────────────────────────────────────────────────

class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({required this.isDark});

  factory ThemeState.light() => const ThemeState(isDark: false);
  factory ThemeState.dark()  => const ThemeState(isDark: true);

  ThemeState copyWith({bool? isDark}) =>
      ThemeState(isDark: isDark ?? this.isDark);

  @override
  List<Object?> get props => [isDark];
}

// ─── Bloc ─────────────────────────────────────────────────────────────────────

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // initial state بتجي من الكاش مباشرةً
  ThemeBloc() : super(ThemeState(isDark: CacheHelper.getIsDark())) {
    on<ToggleThemeEvent>(_onToggle);
    on<SetThemeEvent>(_onSet);
  }

  void _onToggle(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final newVal = !state.isDark;
    CacheHelper.saveIsDark(newVal);   // حفظ في الكاش
    emit(state.copyWith(isDark: newVal));
  }

  void _onSet(SetThemeEvent event, Emitter<ThemeState> emit) {
    CacheHelper.saveIsDark(event.isDark); // حفظ في الكاش
    emit(state.copyWith(isDark: event.isDark));
  }
}