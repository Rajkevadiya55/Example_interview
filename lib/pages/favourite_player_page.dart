// ignore_for_file: prefer_const_constructors

import 'package:demo/controller/favourite_player_controller.dart';
import 'package:demo/models/favouritePlayer/favourite_palyer_lst_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FavouritePlayerPage extends StatefulWidget {
  const FavouritePlayerPage({super.key});

  @override
  State<FavouritePlayerPage> createState() => _FavouritePlayerPageState();
}

class _FavouritePlayerPageState extends State<FavouritePlayerPage> {
  final favouriteCon = Get.find<FavouritePlayerController>();

  @override
  void initState() {
    favouriteCon.pageNumber = 1;
    favouriteCon.pagingController = PagingController(firstPageKey: 0);
    favouriteCon.pagingController.addPageRequestListener((pageKey) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        favouriteCon.getAllPlayerMethod(pageKey: pageKey);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Favourite Player'),
      ),
      body: GetBuilder<FavouritePlayerController>(
        builder: (controller) {
          return PagedListView.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<MyFavoritePlayer>(
                noItemsFoundIndicatorBuilder: (context) {
              return const Center(child: Text('No Data Found'));
            }, itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey.shade300,
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                    child: item.playerImage != null || item.playerImage != ''
                        ? ClipOval(
                            child: Image.network(item.playerImage!),
                          )
                        : const Icon(Icons.person),
                  ),
                  title: Text(item.playerName ?? ''),
                  subtitle: Text('${item.totalLike}'),
                  trailing: GestureDetector(
                    onTap: () {
                      controller.fetchTotalLike();
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            'Vote For Sachin Tendulkar',
                            style: TextStyle(fontSize: 18),
                          ),
                          content: GetBuilder<FavouritePlayerController>(
                            builder: (con) {
                              if (con.isTotalLikeCircular) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "${con.totalLike ?? 00}",
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.pink.shade500),
                                  ),
                                  Text(
                                    'Make your player Win',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.pink.shade300),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.redAccent),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink.shade500,
                      ),
                    ),
                  ),
                ),
              );
            }),
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        },
      ),
    );
  }
}
