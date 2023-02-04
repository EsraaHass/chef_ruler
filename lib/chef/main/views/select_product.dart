import 'package:chef_ruler/chef/main/bloc/main_bloc.dart';
import 'package:chef_ruler/chef/main/bloc/main_event.dart';
import 'package:chef_ruler/chef/main/bloc/main_state.dart';
import 'package:chef_ruler/chef/main/model/product_model.dart';
import 'package:chef_ruler/chef/main/model/select_model.dart';
import 'package:chef_ruler/chef/main/views/select_product_widget.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelsctProduct extends StatefulWidget {
  SelectProductModel? selectProductModel;
  MainPageModel? category;

  SelsctProduct({Key? key, this.selectProductModel, this.category})
      : super(key: key);

  @override
  State<SelsctProduct> createState() => _SelsctProductState();
}

class _SelsctProductState extends State<SelsctProduct> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context)
        .add(SelectProductGetEvent(widget.category?.title ?? ''));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.category?.title ?? '',
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
      body: Column(
        children: [
          BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            if (state is SelectProductInitialState) {
              return Container(
                  height: 250,
                  child: const Center(child: CircularProgressIndicator()));
            } else if (state is SelectProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SelectProductGetState) {
              var product = state.products;

              return Expanded(
                child: (ListView.builder(
                  //shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return SelectProductWidget(model: product[index]);
                  },
                  itemCount: product.length,
                )),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
