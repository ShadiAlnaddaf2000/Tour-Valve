import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/models/all_trip_model.dart';

import '../cubits/trip_details_cubit/trip_details_cubit.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key, required Trip tripDetails});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double p = MediaQuery.of(context).size.width / 20;
    final tripDetails = context.read<TripDetailsCubit>().trip;
    final int? tripId = tripDetails?.id;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Slider Images
          Container(
            width: double.infinity,
            height: h / 3,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(milliseconds: 1500),
              ),
              items: tripDetails?.imgs!
                  .map((item) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: MyColors.colorList,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            width: 2, // Adjust this value for border thickness
                            color: Colors.transparent,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: MyColors.colorList,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstATop,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 6,
                                      // Adjust this value for border thickness
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(p),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultTitle(
                    title: 'Trip Name:',
                    color: Colors.black,
                  ),
                  Text(
                    '${tripDetails?.tripName}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: h / 20),
                  defaultTitle(
                    title: "Description:",
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${tripDetails?.description}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: h / 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dateWidget(
                          label: 'Starting Date',
                          date: '${tripDetails?.startingDate}',
                          color: MyColors.colorList[1],
                          width: w / 2.5,
                        ),
                        SizedBox(width: h / 40),
                        dateWidget(
                          label: 'Ending Date',
                          date: '${tripDetails?.endingDate}',
                          color: MyColors.colorList[1],
                          width: w / 2.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 40),
                  walletWidget(
                    amount: '1000',
                    currency: 'SYR',
                    color: MyColors.colorList[1],
                  ),
                  SizedBox(height: h / 30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: p),
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/tripActivities', extra: tripId as int);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: MyColors.colorList[1], // Border color
                          width: 2,
                        ),
                      ),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: MyColors.colorList,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'Show Trip Activities and Booking',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h / 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoRow(
      {required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: MyColors.colorList[1],
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: MyColors.colorList[1],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget walletWidget({
    required String amount,
    required String currency,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.account_balance_wallet,
            color: Colors.white,
            size: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'COST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$amount $currency',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dateWidget({
    required String label,
    required String date,
    required Color color,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultText({
    required String text,
    required Color color,
    double size = 18,
  }) =>
      Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: 'Zain',
        ),
      );

  Widget defaultTitle({
    required String title,
    required Color color,
  }) =>
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
          fontSize: 24,
        ),
      );
}

class MyColors {
  static const List<Color> colorList = [
    Color.fromRGBO(8, 135, 239, 1),
    Color.fromRGBO(1, 195, 175, 1),
    Color.fromRGBO(8, 135, 239, 1),
    Color.fromRGBO(1, 195, 175, 1),
  ];
}
// class TripDetailsScreen extends StatelessWidget {
//   final Trip tripDetails;
//
//   const TripDetailsScreen({super.key, required this.tripDetails});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('Complete Trip'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 '€${tripDetails.cost}',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 8),
//               CarouselSlider(
//                 options: CarouselOptions(
//                     autoPlay: true,
//                     aspectRatio: 2,
//                     enlargeCenterPage: true,
//                     autoPlayInterval: const Duration(milliseconds: 1500)),
//                 items: tripDetails.imgs
//                     ?.map((item) => Container(
//                   child: Center(
//                     child: Image.network(item,
//                         fit: BoxFit.cover, width: 500),
//                   ),
//                 ))
//                     .toList(),
//               ),
//               Text(
//                 'Received successfully from',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 '${tripDetails.userName}',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Rate User',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 8),
//               RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.blue,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               SizedBox(height: 24),
//               Text(
//                 'Booking Details',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Destinations'),
//                   Text('${tripDetails.tripName}'),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Time Taken'),
//                   Text('${tripDetails.startingDate}'),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Distance'),
//                   Text('${tripDetails.cost} KM'),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Payment Mode'),
//                   Text('Credit Card'),
//                 ],
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Provide your feedback regarding customer',
//                 ),
//                 maxLines: 3,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle continue button press
//                 },
//                 child: Text('CONTINUE'),
//               ),
//               SizedBox(height: 24),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
