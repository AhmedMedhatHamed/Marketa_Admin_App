import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/app_style.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';
import 'package:marketa_admin/features/upload_product/presentation/cubit/upload_product/upload_product_cubit.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UploadProductCubit>();
    final colors = Theme.of(context).extension<AppColors>()!;

    return BlocBuilder<UploadProductCubit, UploadProductState>(
      builder: (context, state) {
        final image = cubit.productImage;

        return GestureDetector(
          onTap: cubit.pickImage,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(14.0),
                child: DottedBorder(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: image != null
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: Image.file(image, fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                child: GestureDetector(
                                  onTap: cubit.removeImage,
                                  child: CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: AppColor.errorMsgColor,
                                    child: const Icon(
                                      Icons.close,
                                      size: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: colors.primary,
                                size: 40.0,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Upload Photo',
                                style: CustomTextStyles.poppins400styles18Black
                                    .copyWith(color: colors.primary),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Tap to select from gallery',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colors.subtext,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
