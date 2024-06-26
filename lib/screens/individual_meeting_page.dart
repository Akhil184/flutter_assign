import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_navigation_bar.dart';
import 'description.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {

  final List<String> authors = [
    'Author',
    'Meet',
    'Author 3',
    'Author 4',
    'Author 5',
    // Add more authors as needed
  ];

  final List<String> imageUrls = [
    'assets/meet.png',
    'assets/bike_meetup.jpeg',
    'assets/career-in-tech-1.png',

  ];
  final List<String> imageUrls1 = [
    'assets/meet.png',
    'assets/bike_meetup.jpeg',
    'assets/career-in-tech-1.png',
    'assets/work.jpeg',
    'assets/person.jpeg',
  ];
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
            'Individual Meetup',
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
        padding: EdgeInsets.all(6.r),
        child:Column(
          children: [
        TextField(
          controller: _searchController,
          focusNode: _searchFocus,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon:Container(
              padding: EdgeInsets.all(8.0), // Adjust padding around the image if needed
              child: Image.asset(
                'assets/search.png',
                height: 27, // Adjust the height of the image as needed
                fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the available space
              ),
            ),
            suffixIcon:Container(
              padding: EdgeInsets.all(8.0), // Adjust padding around the image if needed
              child: Image.asset(
                'assets/mic.png',
                height: 27, // Adjust the height of the image as needed
                fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the available space
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onChanged: (value) {
            // Handle text changes
          },
          onSubmitted: (value) {
            // Handle submission
            print('Submitted: $value');
          },
        ),
            SizedBox(height: 16.h),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.h,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          imageUrl,
                          width: 1.sw,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageUrls.map((url) {
                int index = imageUrls.indexOf(url);
                return Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(index == 0 ? 1 : 0.4),
                  ),
                );
              }).toList(),
            ),
        Padding(
          padding: EdgeInsets.only(left:screenWidth*0.04,top:screenHeight*0.03),
          child:Align(
            alignment: Alignment.centerLeft,
        child:Text(
          'Trending Popular People',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
      ),
      ),
        ),
            SizedBox(height: 20.h),
            Container(
              height:screenHeight*0.27, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of cards
                itemBuilder: (context, index) {
                  return Container(
                    width:screenWidth*0.8, // Adjust width as needed
                    margin: EdgeInsets.only(right:6.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40, // Adjust width and height for your desired size
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black, // Replace with your desired border color
                                    width: 2, // Adjust border width as needed
                                  ),// Replace with your desired background color
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/leave.png', // Replace with your image asset path
                                    width: 40, // Adjust image size as needed
                                    height: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left:screenWidth*0.02),
                                child:
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    authors[index], // Event title
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.blue[600]
                                    ),
                                  ),
                                 Text(
                                    '1028 Meetups', // Event title
                                    style: TextStyle(
                                      fontSize:8.sp,
                                      color:Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                                  ),
                              ),
                      ],
                              ),

                          SizedBox(height: 8.0.h),
                          Expanded(child: Divider(color: Colors.grey)),
                          SizedBox(height: 10.0.h),
                          Container(
                            height:50, // Adjust height as needed
                            width: 300, // Adjust width as needed
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Stack(
                                children: imageUrls1.map((imageUrl1) {
                                  final index = imageUrls1.indexOf(imageUrl1);
                                  final leftPosition = index * 40.0; // Adjust overlap distance as needed
                                  return Positioned(
                                    left: leftPosition,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(imageUrl1),
                                      radius: 25, // Adjust radius as needed
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),

                          // Spacer(),
                          SizedBox(height:4,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                // Implement "Show More" button functionality
                                print('Show more button pressed');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[700]!),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0), // Adjust border radius as needed
                                  ),
                                ),
                                // You can customize other button properties here as needed
                              ),
                              child: Text(
                                'See More',
                                style: TextStyle(
                                  fontSize: 13.sp, // Adjust font size as needed
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            ),
            SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left:screenWidth*0.04,top:screenHeight*0.03),
          child:Align(
            alignment: Alignment.centerLeft,
          child:Text(
            'Top Trending Meetups',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: screenHeight * 0.3, // Adjust height as needed for the parent Container
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Number of cards
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionPage()));
                  // Handle onTap action here

                  // Navigate to a new screen or perform any action as needed
                },
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.3, // Adjust height as needed for each Container
                  margin: EdgeInsets.only(right: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0), // Border radius for the container
                    // border: Border.all(
                    //   color: Colors.grey, // Border color
                    //   width: 2.0, // Border width
                    // ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Match the container's border radius
                    child: Image.asset(
                      'assets/person.png',
                      height: double.infinity, // Ensure the image takes up the full height of the parent Container
                      width: double.infinity, // Ensure the image takes up the full width of the parent Container
                      fit: BoxFit.cover, // Adjust the fit to cover the entire parent Container
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ],
      ),
      ),
    );
  }
}


