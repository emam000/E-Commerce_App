import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/order/model/order_model.dart';
import 'package:store/features/order/view/widgets/product_in_my_orders_widget.dart';
import 'package:store/features/order/view_model/cubit/order_cubit.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width / 50,
          vertical: ScreenSize.height / 50,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<List<OrderModel>>(
                future: BlocProvider.of<OrderCubit>(context).getAllOrders(),
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
                    return BlocProvider.of<OrderCubit>(context).orders.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No Orders Yet",
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Card(
                                    color: kPrimaryColor,
                                    child: ListTile(
                                      title: Text(
                                          "Order ID Number: ${snapshot.data![index].orderId}"),
                                      subtitle: Text(
                                          "Order Created At: ${snapshot.data![index].timestamp.toDate()}"),
                                    ),
                                  ),
                                  spaceVertical(height: ScreenSize.height / 40),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot
                                        .data![index].cartProducts.length,
                                    itemBuilder: (context, prodctIndex) {
                                      return ProductInMyOrdersWidget(
                                        product: snapshot.data![index]
                                            .cartProducts[prodctIndex],
                                        order: snapshot.data![index],
                                      );
                                    },
                                  ),
                                ],
                              );
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
