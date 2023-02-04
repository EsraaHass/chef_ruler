import 'package:chef_ruler/chef/main/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  MainPageModel category;
  int index;

  ProductWidget({Key? key, required this.category, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 2,
      child: Container(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 30,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(18)),
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    //width: 150,
                    height: 80,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
