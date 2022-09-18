import 'package:flutter/material.dart';
import 'package:geekgarden/app/pages/add_page.dart';
import 'package:geekgarden/app/pages/detail_page.dart';
import 'package:geekgarden/app/provider/Products.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allProductProvider = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'All Product',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddProduct.routeName);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: (allProductProvider.jumlahProduct == 0)
            ? Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kosong',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: allProductProvider.jumlahProduct,
                itemBuilder: ((context, index) {
                  var id = allProductProvider.allProduct[index].id;
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailProduct.routeName,
                          arguments: id,
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                                allProductProvider.allProduct[index].image),
                            title: Text(
                                allProductProvider.allProduct[index].title),
                            subtitle: Text(allProductProvider
                                .allProduct[index].description),
                            trailing: IconButton(
                                onPressed: () {
                                  allProductProvider.deleteProduct(id, context);
                                },
                                icon: Icon(Icons.delete)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(allProductProvider
                                  .allProduct[index].category),
                              Text(allProductProvider.allProduct[index].price),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.star),
                              ),
                              Text(allProductProvider.allProduct[index].rating),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ));
  }
}
