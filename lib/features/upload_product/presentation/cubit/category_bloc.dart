import 'package:flutter_bloc/flutter_bloc.dart';

// ─── Categories ───────────────────────────────────────────────────────────────

const List<String> kCategories = [
  'Electronics',
  'Laptops',
  'Mobiles',
  'Cosmetics',
  'Shoes',
  'Watches',
  'Fashion',
  'Books',
];

// ─── Event ────────────────────────────────────────────────────────────────────

class SelectCategoryEvent {
  final String category;
  const SelectCategoryEvent(this.category);
}

// ─── State ────────────────────────────────────────────────────────────────────

class CategoryState {
  final String? selected;
  const CategoryState({this.selected});
}

// ─── Bloc ─────────────────────────────────────────────────────────────────────

class CategoryBloc extends Bloc<SelectCategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<SelectCategoryEvent>((event, emit) {
      emit(CategoryState(selected: event.category));
    });
  }
}