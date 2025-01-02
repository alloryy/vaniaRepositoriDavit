import 'dart:io';
import 'package:project_1/database/migrations/create_user_table.dart';
import 'package:vania/vania.dart';
import 'create_customer_table.dart';
import 'create_orders_table.dart';
import 'create_vendors_table.dart';
import 'create_products_table.dart';
import 'create_productnotes_table.dart';
import 'create_orderitems_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
     await CreateUserTable().up;
		 await OrdersTable().up();
		 await VendorsTable().up();
		 await ProductsTable().up();
		 await OrderitemsTable().up();
		 await ProductnotesTable().up();
		 await CustomerTable().up();
	}

  dropTables() async {
    await CreateUserTable().down();
		 await OrdersTable().down();
		 await VendorsTable().down();
		 await ProductnotesTable().down();
		 await OrderitemsTable().down();
		 await ProductsTable().down();
		 await CustomerTable().down();
	 }
}
