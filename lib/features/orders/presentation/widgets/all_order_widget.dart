import 'package:flutter/material.dart';
import 'package:marketa_admin/core/utils/app_color.dart';
import 'package:marketa_admin/core/utils/text_styles.dart';


class AllOrderWidget extends StatelessWidget {
  const AllOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
          height: MediaQuery.of(context).size.width * 0.28,
          width: MediaQuery.of(context).size.width * 0.28,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              'ProductTitle',
              style: CustomTextStyles.poppinsBoldStyles18Black,
            ),
            Row(
              children: [
                Text(
                  'Price : ',
                  style: CustomTextStyles.poppins400styles18Black,
                ),
                Text('1500 \$', style: CustomTextStyles.poppins300styles16),
              ],
            ),
            Row(
              children: [
                Text('QTY : ', style: CustomTextStyles.poppins400styles18Black),
                Text('10', style: CustomTextStyles.poppins300styles16),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: 10.0),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.0),
              child: Icon(Icons.clear, color: AppColor.errorMsgColor),
            ),
          ],
        ),
      ],
    );
  }
}
