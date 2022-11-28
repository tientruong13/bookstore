import 'package:bookstore/network/book_client.dart';
import 'package:bookstore/shared/model/product.dart';
import 'package:dio/dio.dart';


class OrderService {
  Future<Response> countShoppingCart() {
    return BookClient.instance.dio.get(
      '/order/count',
    );
  }

  Future<Response> addToCart(Product product) {
    return BookClient.instance.dio.post(
      '/order/add',
      data: product.toJson(),
    );
  }

  Future<Response> orderDetail(String orderId) {
    return BookClient.instance.dio.get(
      '/order/detail',
      queryParameters: {
        'order_id': orderId,
      },
    );
  }

  Future<Response> updateOrder(Product product) {
    return BookClient.instance.dio.post(
      '/order/update',
      data: {
        'orderId': product.orderId,
        'quantity': product.quantity,
        'productId': product.productId,
      },
    );
  }

  Future<Response> confirm(String orderId) {
    return BookClient.instance.dio.post(
      '/order/confirm',
      data: {
        'orderId': orderId,
        'status': 'CONFIRM',
      },
    );
  }
}
