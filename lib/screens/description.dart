import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import 'bottom_navigation_bar.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final List<String> images = [
    'assets/baot.png',
    'assets/baot.png',
    'assets/baot.png',
    'assets/baot.png',

  ];
  final List<IconData> icons = [
    Icons.favorite,
    Icons.share,
    Icons.download,
    // Add more icons as needed
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
    onPressed: () {
    Navigator.of(context).pop(); // Implement the back button functionality
    },
    ),
    title:Align(
    alignment: Alignment.centerLeft,
    child: Text(
    'Description',
    style: TextStyle(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    ),
    bottomNavigationBar: BottomNavigationBarWidget(),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.01,left:screenWidth*0.01,right:screenWidth*0.01),
          child: Column(
            children: [
              Container(
                width: screenWidth,
                color: Colors.grey[200], // Background color of the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: images.length,
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0, // Make each item take up the whole width
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              width: screenWidth, // Ensure the container takes up the whole screen width
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.map((url) {
                              int index = images.indexOf(url);
                              return Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index ? Colors.white : Colors.grey,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.file_download_outlined),
                          onPressed: () {
                            // Handle favorite icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {
                            // Handle share icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.heart_broken),
                          onPressed: () {
                            // Handle share icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.fullscreen),
                          onPressed: () {
                            // Handle share icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          onPressed: () {
                            // Handle download icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            Share.share('Check out this content!');
                            // Handle share icon press
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          SizedBox(height:5,),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/rate.png', width: screenWidth * 0.6),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.03,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Actor Name',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02), // Adjusted spacing
                      Text(
                        'Indian Actress',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02), // Adjusted spacing
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined, size: 15.0),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            'Duration 20 Mins',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02), // Adjusted spacing
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet_outlined, size: 15.0),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            'Total Average Fees \u20B9 9,9999', // Added rupee sign
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03), // Adjusted spacing
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.blue[600],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // Adjusted spacing
                      Text(
                        'From cardiovascular health to fitness, flexibility, balance, '
                            'stress relief, better sleep, increased cognitive performance, '
                            'and more, you can reap all of these benefits in just one '
                            'session out on the waves. So, you may find yourself '
                            'wondering what are the benefits of going on a surf camp.',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: screenHeight * 0.02), // Adjusted spacing
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle "See More" button press
                          },
                          child: Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.blue[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
          ),
        )
        ),
    );
  }
}