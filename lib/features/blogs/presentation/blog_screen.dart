import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/blog_store_builder.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/blogs/presentation/controller/get_blogs/get_blogs_bloc.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key, required this.blogArguments});

  final BlogRoutesArguments blogArguments;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    BlocProvider.of<GetBlogsBloc>(context).add(GetBlogsEvent());
    super.initState();
  }

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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
                CustomText(
                  text: StringManager.theMost.tr(),
                  fontSize: AppSize.defaultSize! * 1.8,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(
                    widget.blogArguments.blog.image.toString(),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: AppSize.defaultSize! * 15.2,
                  ),
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 1.6),
              CustomText(
                text: widget.blogArguments.blog.content,
                maxLines: 500,
                textAlign: TextAlign.start,
                fontSize: AppSize.defaultSize! * 1.6,
              ),
              SizedBox(height: AppSize.defaultSize! * 4),
              CustomText(
                text: StringManager.anotherRecommendedArticles.tr(),
                fontSize: AppSize.defaultSize! * 2,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: AppSize.defaultSize! * 1.6),
              SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.blogArguments.blogs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.blogScreen,
                            arguments: BlogRoutesArguments(
                              blogs: widget.blogArguments.blogs,
                              blog: widget.blogArguments.blog,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: BlogStoreBuilder(
                            imageCircular: false,
                            stores: BlogStoreCardInfo(
                                text: widget.blogArguments.blogs[i].title,
                                description:
                                    widget.blogArguments.blogs[i].content,
                                image: widget.blogArguments.blogs[i].image
                                    .toString()),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
