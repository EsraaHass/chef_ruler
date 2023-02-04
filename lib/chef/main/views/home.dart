import 'package:chef_ruler/chef/main/bloc/main_bloc.dart';
import 'package:chef_ruler/chef/main/bloc/main_event.dart';
import 'package:chef_ruler/chef/main/bloc/main_state.dart';
import 'package:chef_ruler/chef/main/views/product_widget.dart';
import 'package:chef_ruler/chef/main/views/select_product.dart';
import 'package:chef_ruler/core/utils/contant/const.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<MainBloc>(context);
    bloc.add(MainGetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
              text: 'مكانك في ',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 19),
              children: <TextSpan>[
                TextSpan(
                    text: 'الاسماعيليه',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.redSystem,
                        fontWeight: FontWeight.w400,
                        fontSize: 19)),
              ]),
        ),
        actions: const [
          Icon(
            Icons.search_rounded,
            size: 30,
            color: MyTheme.darkprimary,
          ),
          SizedBox(
            width: 5,
          )
        ],
        leading: const Icon(
          Icons.notifications,
          size: 30,
          color: MyTheme.darkprimary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('< المزيد',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyTheme.redSystem,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(more_products);
                  },
                ),
                Text(
                  'اختر من الفئات',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              if (state is MainInitialState) {
                return Container(
                    height: 250,
                    child:
                        const Center(child: Text('لا يوجد داتا متاحه لعرضها')));
              } else if (state is MainLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MainGetProductState) {
                var products = state.products;

                return GridView.builder(
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
                  itemCount: 4,
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
