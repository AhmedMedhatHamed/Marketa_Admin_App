part of 'upload_product_cubit.dart';

@immutable
sealed class UploadProductState {}

final class UploadProductInitial extends UploadProductState {}

final class UploadProductLoading extends UploadProductState {}

final class UploadProductSuccess extends UploadProductState {}

final class UploadProductError extends UploadProductState {
  final String message;
   UploadProductError(this.message);
}

final class UploadProductImagePicked extends UploadProductState {
  final File image;
   UploadProductImagePicked(this.image);
}

final class UploadProductInitialized extends UploadProductState {}