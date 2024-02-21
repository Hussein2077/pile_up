import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/blog_store_builder.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/presentation/controller/get_blogs/get_blogs_bloc.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  BlogModel? tempData;

  @override
  void initState() {
    BlocProvider.of<GetBlogsBloc>(context)
        .add(GetBlogsEvent());

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
      body: BlocBuilder<GetBlogsBloc, GetBlogsState>(
        builder: (context, state) {
          if (state is GetBlogsSuccessMessageState){
            tempData = state.internModel[0];
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSize.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      tempData!.image.toString(),
                      fit: BoxFit.fill,
                      width: AppSize.screenWidth! * .85,
                      height: AppSize.defaultSize! * 15.2,
                    ),
                  ),
                  CustomText(
                    text: tempData!.content ,

                    maxLines: 500,
                    textAlign: TextAlign.start,
                    fontSize: AppSize.defaultSize! * 1.6,
                  ),
                  CustomText(
                    text: StringManager.anotherRecommendedArticles.tr(),
                    fontSize: AppSize.defaultSize! * 1.8,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: AppSize.defaultSize! * 1.6,),
                  SizedBox(

                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.internModel.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.blogDetailsScreen);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0),
                              child: BlogStoreBuilder(
                                blog: false,
                                stores: BlogStoreCardInfo(
                                    text: state.internModel[i].title,
                                    description:
                                    state.internModel[i].content,
                                    image: state.internModel[i].image.toString()),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
          } else if (state is GetBlogsLoadingState) {
              return const LoadingWidget();
            }
          else if(state
          is GetBlogsErrorMessageState){
            return ErrorWidget(state.errorMessage);
          }else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}
