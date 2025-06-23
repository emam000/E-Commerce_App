import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/payment_methods.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';
import 'package:store/features/order/model/order_model.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

//! create Order ...
  String? currentOrderId;

  Future<void> createOrder({
    required CartCubit cartCubit,
    required CheckoutCubit checkoutCubit,
  }) async {
    try {
      emit(CreateOrderLoading());
      // await deleteOldDraftOrders();
      String? userId = await getUserDocId();

      CollectionReference orders = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("orders");

      final orderID = orders.doc();

      OrderModel order = OrderModel(
        orderId: orderID.id,
        userId: userId ?? "",
        address: checkoutCubit.address,
        shippingType: checkoutCubit.shippingType.toString(),
        cartProducts: cartCubit.cartProducts,
        subtotal: cartCubit.subTotal,
        discount: cartCubit.discount,
        deliveryFees: cartCubit.deliveryFees,
        total: cartCubit.total,
        timestamp: Timestamp.now(),
        //! payment status... paid or un paid
        //! oeder status .. completed or canceld or ... in ui
        status:
            checkoutCubit.selectedPaymentMethod == PaymentMethod.cashOnDelivery
                ? "Done & Unpaid"
                : "Done & paid ",
        paymentMethod: checkoutCubit.selectedPaymentMethod?.toString() ?? "",
      );

      await orderID.set(order.toMap());

      log("order added");

      currentOrderId = orderID.id;
      emit(CreateOrderSuccess());
    } catch (e) {
      emit(CreateOrderError(message: e.toString()));
    }
  }

  //! update Order Payment And Status ...

  Future<void> updateOrderPaymentAndStatus({
    required String orderId,
    required String paymentMethod,
  }) async {
    try {
      String? userId = await getUserDocId();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("orders")
          .doc(orderId)
          .update({
        "paymentMethod": paymentMethod,
        "status": "Paid",
      });

      emit(UpdateOrderSuccess());
      log("Order updated");
    } catch (e) {
      emit(UpdateOrderError(message: e.toString()));
      log("Error updating order: $e");
    }
  }

//!delete  Order ...

  Future<void> deleteOrder() async {
    try {
      String? userId = await getUserDocId();

      if (currentOrderId != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("orders")
            .doc(currentOrderId)
            .delete();

        currentOrderId = null;

        emit(DeleteOrderSuccess());
        log("Order draft deleted");
      }
    } catch (e) {
      emit(DeleteOrderError(message: e.toString()));
      log("Error deleting draft order: $e");
    }
  }

  //! delete old Order ...

  Future<void> deleteOldDraftOrders() async {
    try {
      String? userId = await getUserDocId();
      final time = Timestamp.fromDate(
        DateTime.now().subtract(const Duration(minutes: 1)),
      );
      var draftOrders = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("orders")
          .where(
            'timestamp',
            isLessThan: time,
          )
          .where('status', isEqualTo: "Draft")
          .get();

      for (var doc in draftOrders.docs) {
        await doc.reference.delete();
      }
      emit(DeleteOldOrderSuccess());
      log("Old orders deleted");
    } catch (e) {
      emit(DeleteOldOrderError(message: e.toString()));
      log("Error deleting old orders: $e");
    }
  }

//! get all orders  ...

  List<OrderModel> orders = [];

  Future<List<OrderModel>> getAllOrders() async {
    try {
      emit(GetAllOrdersLoading());

      orders.clear();
      String? docUserID = await getUserDocId();

      var snapShot = await FirebaseFirestore.instance
          .collection("users")
          .doc(docUserID)
          .collection("orders")
          .get();
      for (var item in snapShot.docs) {
        orders.add(OrderModel.fromJson(item.data()));
      }
      if (orders.isEmpty) {
        emit(GetAllOrdersEmpty());
        return [];
      }
      log("orders : ${orders.length.toString()}");
      emit(GetAllOrdersSuccess());
      return orders;
    } on FirebaseException catch (e) {
      emit(GetAllOrdersError(message: e.toString()));
      throw Exception(e.toString());
    } catch (e) {
      emit(GetAllOrdersError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
