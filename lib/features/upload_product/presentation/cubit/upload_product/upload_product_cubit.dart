import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketa_admin/features/product/data/models/product_model.dart';

part 'upload_product_state.dart';

class UploadProductCubit extends Cubit<UploadProductState> {
  UploadProductCubit() : super(UploadProductInitial());

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? productImage;
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
    productImage = null;
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




  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      productImage = File(picked.path);
      emit(UploadProductImagePicked(productImage!));
    }
  }

  void removeImage() {
    productImage = null;
    imageUrl     = null; // ← يمسح الـ network image كمان
    emit(UploadProductInitial());
  }

  ////////////////////////////////////////////
  String? imageUrl;

  void initWithProduct(ProductModel product) {
    titleController.text       = product.productTitle;
    priceController.text       = product.productPrice.toString();
    qtyController.text         = product.productQuantity.toString();
    descriptionController.text = product.productDescription;
    selectedCategory           = product.productCategory;
    imageUrl                   = product.productImage; // ← حفظ الـ URL
    emit(UploadProductInitialized());
  }

  void updateProduct() {
    if (!formKey.currentState!.validate()) return;
    emit(UploadProductLoading());
    // هنا بعت للـ API الـ update
    emit(UploadProductSuccess());
  }
}
