import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
class TopCarousel extends StatefulWidget {
  const TopCarousel({super.key});

  @override
  State<TopCarousel> createState() => _TopCarouselState();
}

class _TopCarouselState extends State<TopCarousel> {
  late CarouselController carouselController;

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }
  int myCurrentIndex = 0;

  final myitems = [
    Image.asset('assets/images/Mask group@3x.png'),
    Image.asset('assets/images/Mask group5@3x.png'),
    Image.asset('assets/images/Mask group4@3x.png'),
    Image.asset('assets/images/Mask group3@3x.png'),
    Image.asset('assets/images/Mask group2@3x.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              viewportFraction: 2,
              height: 300,
              onPageChanged: (index, reason) {
                setState(() {
                  myCurrentIndex = index;
                });
              }),
          items: myitems,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: widget.carouselList.map((e){},
        // ),
        Container(
          height: AppSize.defaultSize!*10,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color.fromRGBO(0, 0, 0, 1).withOpacity(.2),
                    const Color.fromRGBO(0, 0, 0, 1).withOpacity(.4),
                    const Color.fromRGBO(0, 0, 0, 1).withOpacity(.7),
                  ])),
        ),
        Column(
          children: [
            Padding(
              padding:   EdgeInsets.only(bottom: AppSize.defaultSize!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shop ',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TT Norms Pro Bold.otf',
                        color: Colors.white),
                  ),
                  Text('Better, ',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'TT Norms Pro Bold.otf',
                          color: Color.fromRGBO(3, 188, 164, 1),
                          fontWeight: FontWeight.bold)),
                  Text(
                    'look',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TT Norms Pro Bold.otf',
                        color: Colors.white),
                  ),
                  Text(' good',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'TT Norms Pro Bold.otf',
                          color: Color.fromRGBO(3, 188, 164, 1),
                          fontWeight: FontWeight.bold)),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myitems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width:myCurrentIndex == entry.key? AppSize.defaultSize!*4:AppSize.defaultSize!*1.5,
                    height: AppSize.defaultSize!*.3,
                    margin:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.primaryColor)
                          .withOpacity(myCurrentIndex == entry.key ? 1 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),

      ],
    );
  }
}
