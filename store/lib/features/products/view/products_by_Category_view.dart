import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/category/model/category_model.dart';
import 'package:store/features/products/model/product_model.dart';
import 'package:store/features/products/view/widgets/get_All_products_by_category_widget.dart';
import 'package:store/features/products/view_model/cubit/product_cubit.dart';

class ProductsByCategoryView extends StatefulWidget {
  const ProductsByCategoryView({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<ProductsByCategoryView> createState() => _ProductsByCategoryViewState();
}

class _ProductsByCategoryViewState extends State<ProductsByCategoryView> {
  @override
  Widget build(BuildContext context) {
    ProductCubit productCubit = BlocProvider.of<ProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(
            fontSize: ScreenSize.width / 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: kbackcolor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.width / 60),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Products By ${widget.categoryModel.name}",
                    style: TextStyle(
                      fontSize: ScreenSize.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              spaceVertical(height: ScreenSize.height / 30),
              //! future builder for get products by category ... ....

              FutureBuilder<List<ProductModel>>(
                future: productCubit.getProductsByCategory(
                    categoryId: widget.categoryModel.categoryId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GetAllProductsByCategoryWidget(
                        productsByCategory: snapshot.data!);
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
