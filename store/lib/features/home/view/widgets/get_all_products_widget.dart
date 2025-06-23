import 'package:flutter/material.dart';
import 'package:store/features/home/view/widgets/product_card_widget.dart';
import 'package:store/features/products/model/product_model.dart';

class GetAllProductsWidget extends StatefulWidget {
  const GetAllProductsWidget({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<GetAllProductsWidget> createState() => _GetAllProductsWidgetState();
}

class _GetAllProductsWidgetState extends State<GetAllProductsWidget> {
  @override
  void initState() {
    super.initState();
  }

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
      itemCount: widget.products.length,
      //  categoryCubit.filterCAtegory.isEmpty
      //     ? homeCubit.products.length
      //     : categoryCubit.filterCAtegory.length
      itemBuilder: (context, index) {
        return ProductCardWidget(
          products: widget.products[index],
        );
      },
    );
  }
}
