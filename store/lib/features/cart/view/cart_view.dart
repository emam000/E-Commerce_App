import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/cart/view/widgets/cart_empty_widget.dart';
import 'package:store/features/cart/view/widgets/order_summary_widget.dart';
import 'package:store/features/cart/view/widgets/product_in_cart_widget.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Scaffold(
        body: context.read<CartCubit>().cartProducts.isEmpty ||
                state is CartProductsListIsEmpty
            ? CartEmptyWidget()
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width / 50,
                        vertical: ScreenSize.height / 50,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            StreamBuilder<List<CartModel>>(
                              stream: BlocProvider.of<CartCubit>(context)
                                  .getAllCartProducts(),
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
                                  // return GetAllProductsWidget(products: snapshot.data!);
                                  return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: ScreenSize.height / 100,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return ProductInCartWidget(
                                        cartModel: snapshot.data![index],
                                      );
                                    },
                                  );
                                } else {
                                  return SizedBox(
                                    child: Center(child: Text("No Data")),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  OrderSummaryWidget(),
                ],
              ),
      );
    });
  }
}
