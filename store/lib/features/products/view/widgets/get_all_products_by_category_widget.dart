import 'package:flutter/material.dart';
import 'package:store/features/home/view/widgets/product_card_widget.dart';
import 'package:store/features/products/model/product_model.dart';

class GetAllProductsByCategoryWidget extends StatefulWidget {
  const GetAllProductsByCategoryWidget(
      {super.key, required this.productsByCategory});
  final List<ProductModel> productsByCategory;
  @override
  State<GetAllProductsByCategoryWidget> createState() =>
      _GetAllProductsByCategoryWidgetState();
}

class _GetAllProductsByCategoryWidgetState
    extends State<GetAllProductsByCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.productsByCategory.length,
      //  categoryCubit.filterCAtegory.isEmpty
      //     ? homeCubit.products.length
      //     : categoryCubit.filterCAtegory.length
      itemBuilder: (context, index) {
        return ProductCardWidget(products: widget.productsByCategory[index]);
      },
    );
  }
}
