import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_product_state.dart';

class UploadProductCubit extends Cubit<UploadProductState> {
  UploadProductCubit() : super(UploadProductInitial());

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? selectedCategory;

  void selectCategory(String category) {
    selectedCategory = category;
  }

  void uploadProduct() {
    if (!formKey.currentState!.validate()) return;
    if (selectedCategory == null) {
      emit(UploadProductError('Please select a category'));
      return;
    }

    emit(UploadProductLoading());

    // هنا هتبعت للـ API
    // await repo.uploadProduct(...)

    emit(UploadProductSuccess());
  }

  void clearForm() {
    titleController.clear();
    priceController.clear();
    qtyController.clear();
    descriptionController.clear();
    selectedCategory = null;
    emit(UploadProductInitial());
  }

  @override
  Future<void> close() {
    titleController.dispose();
    priceController.dispose();
    qtyController.dispose();
    descriptionController.dispose();
    return super.close();
  }


}
