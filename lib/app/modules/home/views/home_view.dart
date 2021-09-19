import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipe App'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return foodContainer(
              controller.teslaNewsArticles[index].urlToImage!,
              controller.teslaNewsArticles[index].title!,
            );
          },
          itemCount: controller.teslaNewsArticles.length,
          shrinkWrap: true,
        ));
  }

  Container foodContainer(
    String image,
    String title,
  ) {
    return Container(
      height: Get.height * .25,
      width: Get.width,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: Get.height * .25,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Title',
            style: Get.textTheme.headline4!.copyWith(
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    Text(
                      '3.0',
                      style: Get.textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    Text(
                      '20 min',
                      style: Get.textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      //
    );
  }
}
