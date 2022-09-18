import 'package:geekgarden/app/provider/Products.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:geekgarden/app/model/product.dart';

class DetailProduct extends StatelessWidget {
  static const routeName = "/detail-product";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final productid = ModalRoute.of(context)?.settings.arguments as String;
    final selectProduct = products.selectByID(productid);
    final TextEditingController imageController =
        TextEditingController(text: selectProduct.image);

    final TextEditingController idController =
        TextEditingController(text: selectProduct.id);

    final TextEditingController titleController =
        TextEditingController(text: selectProduct.title);

    final TextEditingController descriptionController =
        TextEditingController(text: selectProduct.description);

    final TextEditingController categoryController =
        TextEditingController(text: selectProduct.category);

    final TextEditingController priceController =
        TextEditingController(text: selectProduct.price);

    final TextEditingController ratingController =
        TextEditingController(text: selectProduct.rating);

    return Scaffold(
      appBar: AppBar(title: Text('Detail Product')
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageController.text),
                    ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "ID"),
                textInputAction: TextInputAction.next,
                controller: idController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                controller: titleController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Descriptsion"),
                textInputAction: TextInputAction.next,
                controller: descriptionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Category"),
                textInputAction: TextInputAction.next,
                controller: categoryController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                controller: priceController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  products.editProduct(
                    productid,
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
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    products.editProduct(
                    productid,
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
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}
