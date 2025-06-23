import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/category/model/category_model.dart';
import 'package:store/features/category/view_model/cubit/category_cubit.dart';
import 'package:store/features/home/model/banner_model.dart';
import 'package:store/features/home/view/widgets/banners_indicator_widget.dart';
import 'package:store/features/home/view/widgets/get_all_banners_widget.dart';
import 'package:store/features/home/view/widgets/get_all_home_category_widget.dart';
import 'package:store/features/home/view/widgets/get_all_products_widget.dart';
import 'package:store/features/home/view/widgets/home_category_head_line.dart';
import 'package:store/features/home/view/widgets/home_product_head_line_widget.dart';
import 'package:store/features/home/view/widgets/home_search_bar.dart';
import 'package:store/features/home/view_model/cubit/home_cubit.dart';
import 'package:store/features/products/model/product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.width / 60),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeSearchBarWidget(
                homeCubit: homeCubit,
              ),

              spaceVertical(height: ScreenSize.height / 30),

              //! future builder for banners ....

              FutureBuilder<List<BannerModel>>(
                future: context.read<HomeCubit>().getAllBanners(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GetAllBannersWidget(
                      pageController: pageController,
                      banners: snapshot.data!,
                    );
                  } else {
                    return SizedBox(
                      child: Text("No Data"),
                    );
                  }
                },
              ),
              spaceVertical(height: ScreenSize.height / 60),

              BannersIndicatorWidget(pageController: pageController),

              spaceVertical(height: ScreenSize.height / 60),

              HomeCategoryHeadLineWidget(),

              //! future builder for get all category ...

              FutureBuilder<List<CategoryModel>>(
                future: context.read<CategoryCubit>().getAllCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GetAllHomeCategoryWidget(
                      categories: snapshot.data!,
                    );
                  } else {
                    return SizedBox(
                      child: Text("No Data"),
                    );
                  }
                },
              ),
              spaceVertical(height: ScreenSize.height / 60),
              HomeProductsHeadLineWidget(),

              spaceVertical(height: ScreenSize.height / 35),

              //! future builder for get all Products ....
              FutureBuilder<List<ProductModel>>(
                future: context.read<HomeCubit>().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return GetAllProductsWidget(
                            products: homeCubit.filterAllProduct.isEmpty
                                ? snapshot.data!
                                : homeCubit.filterAllProduct);
                      },
                    );
                  } else {
                    return SizedBox(
                      child: Text("No Data"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
