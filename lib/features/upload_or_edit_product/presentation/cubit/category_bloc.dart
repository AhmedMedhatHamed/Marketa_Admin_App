import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> kCategories = [
  'Electronics',
  'Shoes',
  'Laptops',
  'Phones',
  'Cosmetics',
  'Watches',
  'Fashion',
  'Books',
  'Accessories',
];

class SelectCategoryEvent {
  final String category;
  const SelectCategoryEvent(this.category);
}

class CategoryState {
  final String? selected;
  const CategoryState({this.selected});
}

class CategoryBloc extends Bloc<SelectCategoryEvent, CategoryState> {
  CategoryBloc({String? initialCategory})
    : super(CategoryState(selected: initialCategory)) {
    // ← بياخد القيمة الأولى
    on<SelectCategoryEvent>((event, emit) {
      emit(CategoryState(selected: event.category));
    });
  }
}
