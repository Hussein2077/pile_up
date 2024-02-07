import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class BlogComplete extends StatefulWidget {
  const BlogComplete({super.key});

  @override
  State<BlogComplete> createState() => _BlogCompleteState();
}

class _BlogCompleteState extends State<BlogComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size(AppSize.screenWidth!, AppSize.defaultSize! * 3),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_new_rounded))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
