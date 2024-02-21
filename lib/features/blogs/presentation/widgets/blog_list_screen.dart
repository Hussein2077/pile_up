import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/blog_store_builder.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/blogs/presentation/controller/get_blogs/get_blogs_bloc.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  void initState() {
    BlocProvider.of<GetBlogsBloc>(context).add(GetBlogsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.blogs.tr(), isIcon: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.defaultSize!,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringManager.veryUsefulArticles.tr(),
                  color: AppColors.blackLow,
                  fontSize: AppSize.defaultSize! * 2,
                  fontWeight: FontWeight.w700,
                ),
                Image.asset(
                  AssetPath.filter,
                  height: AppSize.defaultSize! * 2.7,
                  width: AppSize.defaultSize! * 3.1,
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GetBlogsBloc, GetBlogsState>(
              builder: (context, state) {
                if (state is GetBlogsSuccessMessageState) {
                  return ListView.builder(
                      itemCount: state.internModel.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize!),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.blogDetailsScreen);
                            },
                            child: BlogStoreBuilder(
                              stores: BlogStoreCardInfo(
                                  text: state.internModel[index].title,
                                  description:
                                  state.internModel[index].content,
                                  image: state.internModel[index].image.toString(),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (state is GetBlogsLoadingState) {
                  return const LoadingWidget();
                } else if (state is GetBlogsErrorMessageState) {
                  return ErrorWidget(state.errorMessage);
                } else {
                  return const EmptyWidget();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
