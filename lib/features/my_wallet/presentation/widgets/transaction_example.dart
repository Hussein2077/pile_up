import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class TransactionExample extends StatelessWidget {
  const TransactionExample({
    super.key,
    required this.isTransactionIn,
    required this.name,
    required this.amount,
    required this.date,
    required this.isSuccess,
  });

  final bool isTransactionIn;
  final String name;
  final double amount;
  final String date;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          isTransactionIn
              ? AssetPath.upwardArrowWithAvatar
              : AssetPath.downwardArrowWithAvatar,
          width: AppSize.defaultSize! * 4.8,
          height: AppSize.defaultSize! * 4.8,
        ),
        SizedBox(width: AppSize.defaultSize! * 1.6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: AppSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w700
              ),
            ),
            Row(
              children: [
                Text('${date} . ',
                  style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
                isTransactionIn ? Text('Success',
                  style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.transactionSuccessColor,
                  ),
                ) : Text('Failed',
                    style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.transactionFailedColor,
                    ),
                    )
              ],
            ),
            Text('${amount.toString()} EGP',
              style: TextStyle(
                fontSize: AppSize.defaultSize! * 2,
                fontWeight: FontWeight.w700,
                color: AppColors.transactionSuccessColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
