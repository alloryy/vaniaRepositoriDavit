import 'package:vania/vania.dart';

class ProductsTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('products', () {
      string("prod_id",length: 10);
      primary("prod_id");
      string("prod_name",length: 25);
      integer("prod_price",length: 11);
      text("prod_desc");
      char("vend_id",length: 5);
      foreign("vend_id", "vendors", "vend_id");
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('products');
  }
}
