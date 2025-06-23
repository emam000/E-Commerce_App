import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/category/model/category_model.dart';
import 'package:store/features/category/view/widgets/get_all_categories_widget.dart';
import 'package:store/features/category/view_model/cubit/category_cubit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = BlocProvider.of<CategoryCubit>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width / 25,
          vertical: ScreenSize.height / 100,
        ),
        child: //! future builder for get all categories ....
            FutureBuilder<List<CategoryModel>>(
          future: categoryCubit.getAllCategory(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(
            //     child: CircularProgressIndicator(
            //       color: kPrimaryColor,
            //     ),
            //   );
            // } else
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return GetAllCategoriesWidget(categories: snapshot.data!);
            } else {
              return SizedBox(
                child: Text("No Data"),
              );
            }
          },
        ),
      ),
    );
  }
}
