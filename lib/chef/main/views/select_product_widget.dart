import 'package:chef_ruler/chef/main/model/select_model.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:flutter/material.dart';

class SelectProductWidget extends StatelessWidget {
  SelectProductModel model;

  SelectProductWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
      child: Container(
        height: size.height * 0.25,
        width: size.width,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 5,
            color: Colors.white,
            // padding: const EdgeInsets.only(top: 15,right: 15),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: size.height * 0.13,
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.13,
                  right: 16,
                  child: Text(
                    model.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    height: 25,
                    width: 50,
                    child: DecoratedBox(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey,
                              spreadRadius: 2)
                        ], shape: BoxShape.rectangle, color: Colors.white),
                        child: Text(
                          ' ${model.price} LE',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: MyTheme.redSystem),
                        )),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.07,
                  right: 16,
                  child: Text(
                    model.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.04,
                  right: 16,
                  child: Text(
                    model.gender,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.01,
                  right: 16,
                  child: Text(
                    '  خدمه التوصيل           ${model.delevaryService} ج.م ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
