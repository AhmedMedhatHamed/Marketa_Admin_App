import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';

import 'custom_buttons.dart';

class EmptyCartBag extends StatelessWidget {
  const EmptyCartBag({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onPressed,
  });
  final String image, title, subtitle, buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Image.asset(
                image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(height: 20.0),
              Text(
                'Whoops!',
                style: CustomTextStyles.poppinsBoldStyles26.copyWith(
                  color: AppColor.errorMsgColor,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                title,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
              SizedBox(height: 15.0),
              Text(
               subtitle,
                style: CustomTextStyles.poppins300styles16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              CustomButton(text: buttonText, onPressed: onPressed,),
            ],
          ),
        ),
      ),
    );
  }
}
