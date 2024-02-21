import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/details_screen.dart';

class TrendingSlider extends StatelessWidget {
const TrendingSlider({ Key? key, required this.snapshot }) : super(key: key);

final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
                  itemCount: 10, 
                  itemBuilder: (context, itemIndex, pagePreviewIndex) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              movie: snapshot.data[itemIndex],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 300,
                          width: 200,
                          child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Constant.imagePath}${snapshot.data[itemIndex].posterPath}',
                          ),
                        ),
                      ),
                    );
                  }, 
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                  ),
                ),
    );
  }
}