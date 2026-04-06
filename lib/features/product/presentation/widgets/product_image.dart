import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {

    return Image.network(
      image,
      height: MediaQuery.of(context).size.height*0.38,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}