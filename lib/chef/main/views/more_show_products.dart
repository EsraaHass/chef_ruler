import 'package:chef_ruler/chef/main/bloc/main_bloc.dart';
import 'package:chef_ruler/chef/main/bloc/main_state.dart';
import 'package:chef_ruler/chef/main/views/product_widget.dart';
import 'package:chef_ruler/chef/main/views/select_product.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreShowProducts extends StatelessWidget {
  const MoreShowProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'اختر من الفئات',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 30,
            ),
            color: MyTheme.darkprimary,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state is MainInitialState) {
            return Container(
                height: 250,
                child: const Center(child: Text('لا يوجد داتا متاحه لعرضها')));
          } else if (state is MainLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MainGetProductState) {
            var products = state.products;

            return Container(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (_) =>
                                  SelsctProduct(category: products[index])));
                    },
                    child: ProductWidget(
                      category: products[index],
                      index: index,
                    ),
                  );
                },
                itemCount: products.length,
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
