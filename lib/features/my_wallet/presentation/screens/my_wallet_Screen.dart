import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/features/my_wallet/presentation/widgets/transaction_example.dart';

class MyWalletDetails extends StatefulWidget {
  const MyWalletDetails({super.key});

  @override
  State<MyWalletDetails> createState() => _MyWalletDetailsState();
}

class _MyWalletDetailsState extends State<MyWalletDetails>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar(context, text: 'My Wallet Details', isIcon: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.defaultSize! * 1.6,
          vertical: AppSize.defaultSize! * 1.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Money',
              style: TextStyle(
                fontSize: AppSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'EGP 4000',
              style: TextStyle(
                fontSize: AppSize.defaultSize! * 2.8,
                fontWeight: FontWeight.w800
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 1.6),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.borderColor, width: .5),
              ),
              height: AppSize.defaultSize! * 48.7,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const TransactionExample(
                        isTransactionIn: true,
                        name: 'Mohamed Ahmed',
                        date: '28/3/2024',
                        isSuccess: true,
                        amount: 800,
                      );
                    }),
              ),
            ),
            //       Container(
            //         width: AppSize.defaultSize! * 36,
            //         height: AppSize.defaultSize! * 48.7,
            //         child: Card(
            //           child: Column(
            //             children: [
            //           Container(
            //           height: AppSize.screenHeight! * .5,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(AppSize.defaultSize!),
            //             ),
            //             child: DefaultTabController(
            //               length: 2,
            //               child: Column(
            //             children: [
            //             InOutTabBar(
            //             tabController: tabController,
            //             ),
            //             SizedBox(
            //               height: AppSize.screenHeight! * .4,
            //               child: TabBarView(
            //                   controller: tabController,
            //                   children: const [
            //                     InTransactions(),
            //                     InTransactions(),
            //                   ]),
            //             ),
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),),
          ],
        ),
      ),
    );
  }
}
