// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_store/bloc/productById/productById_event.dart';
import 'package:ecommerce_store/model/category.dart';
import 'package:ecommerce_store/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_store/bloc/productById/productById_bloc.dart';
import 'package:ecommerce_store/bloc/productById/productById_state.dart';
import 'package:ecommerce_store/constants/colors.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final Category category;
  const ProductsByCategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  void initState() {
    super.initState(); 
    BlocProvider.of<ProductByIdBloc>(context)
        .add(ProductByIdGetInitializedData(widget.category.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundScreenColor,
      body: BlocBuilder<ProductByIdBloc, ProductByIdState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                if (state is ProductByIdLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                },
                //TODO Category Name
                if (state is ProductByIdResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 44, right: 44, bottom: 20),
                      child: Container(
                        height: 46,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/images/icon_back.png'),
                            Expanded(
                                child: state.productList.fold(
                              (l) {
                                return const Text(
                                  "error text",
                                  style: TextStyle(
                                      color: ConstColor.blue, fontSize: 16),
                                  textAlign: TextAlign.center,
                                );
                              },
                              (productCategory) {
                                return Text(
                                  "${widget.category.title}",
                                  style: const TextStyle(
                                      color: ConstColor.blue, fontSize: 16),
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                            Image.asset('assets/images/icon_apple_blue.png'),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                },
                if (state is ProductByIdResponseState) ...{
                  state.productList.fold(
                    (l) {
                      return const SliverToBoxAdapter(
                        child: Text("nothing"),
                      );
                    },
                    (r) {
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductItem(product: r[index]);
                            },
                            childCount: r.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.8,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30,
                          ),
                        ),
                      );
                    },
                  )
                }
              ],
            ),
          );
        },
      ),
    );
  }
}
