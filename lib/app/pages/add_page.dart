import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geekgarden/app/provider/Products.dart';
import 'package:provider/provider.dart';


class AddProduct extends StatelessWidget {

  static const routeName = "/add-product";
  
  final TextEditingController imageController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final products = Provider.of(context, listen: false);
     
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'input ID',
                
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tittle here',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'input Price',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'input Description',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Drop Image',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () {
                 products.addProduct(
                    idController.text,
                    titleController.text,
                    descriptionController.text,
                    categoryController.text,
                    priceController.text,
                    imageController.text,
                    context,
              );
                    Navigator.pop(context);
                  },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
