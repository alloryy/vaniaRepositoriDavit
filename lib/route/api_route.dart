import 'package:project_1/app/http/controllers/auth_controller.dart';
import 'package:project_1/app/http/controllers/customer_controller.dart';
import 'package:project_1/app/http/controllers/orderitems_controller.dart';
import 'package:project_1/app/http/controllers/orders_controller.dart';
import 'package:project_1/app/http/controllers/products_controller.dart';
import 'package:project_1/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.group(() {
      Router.post('register', authController.register);
      var post = Router.post('login', authController.login);
    }, prefix: 'auth');
    // Route Customers
    Router.get('/customer', customerController.show);
    Router.post('/create-customer', customerController.store);
    Router.put('/update-customer/{cust_id}', customerController.update);
    Router.delete('/delete-customer/{cust_id}', customerController.destroy);
// Router Order
    Router.get('/order', ordersController.show);
    Router.post('/create-order', ordersController.store);
    Router.put('/update-order/{order_num}', ordersController.update);
    Router.delete('/delete-order/{order_num}', ordersController.destroy);

// Router OrderItems
    Router.get('/orderitems', orderitemsController.show);
    Router.post('/create-orderitems', orderitemsController.store);
    Router.put('/update-orderitems/{order_item}', orderitemsController.update);
    Router.delete('/delete-orderitems/{order_item}', orderitemsController.destroy);

    // Route Produk
    Router.get('/product', productsController.show);
    Router.post('/create-product', productsController.store);
    Router.put('/update-product/{prod_id}', productsController.update);
    Router.delete('/delete-product/{prod_id}', productsController.destroy);

    // Route Produknotes
    Router.get('/productnotes', productsController.show);
    Router.post('/create-productnotes', productsController.store);
    Router.put('/update-productnotes/{note_id}', productsController.update);
    Router.delete('/delete-productnotes/{note_id}', productsController.destroy);

    //Route Vendor 
    Router.get('/vendor', vendorsController.show);
    Router.post('/create-vendor', vendorsController.store);
    Router.put('/update-vendor/{vend_id}', vendorsController.update);
    Router.delete('/delete-vendor/{vend_id}', vendorsController.destroy);
  }
}
