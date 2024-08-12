import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 16),
            buildSearchBox(),
            const SizedBox(height: 32),
            buildSectionTitle('popular places'),
            const SizedBox(height: 16),
            buildHorizontalList([
              DestinationCard(
                imagePath: 'assets/images/1.jpg',
                location: 'فرنسا',
              ),
              DestinationCard(
                imagePath: 'assets/images/1.jpg',
                location: 'فرنسا',
              ),
              DestinationCard(
                imagePath: 'assets/images/2.jpg',
                location: 'سويسرا',
              ),
            ]),
            const SizedBox(height: 32),
            buildSectionTitle('popular hotels'),
            const SizedBox(height: 16),
            buildHorizontalList([
              HotelCard(
                imagePath: 'assets/images/3.jpg',
                hotelName: 'فندق الكونكورد',
                price: '400\$',
              ),
              HotelCard(
                imagePath: 'assets/images/4.jpg',
                hotelName: 'فندق الريتز',
                price: '500\$',
              ),
              HotelCard(
                imagePath: 'assets/images/4.jpg',
                hotelName: 'فندق الريتز',
                price: '500\$',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Text(
      'We are here for your convenience',
      style: TextStyle(
        fontFamily: 'Poppins', // Use the family name specified in pubspec.yaml
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
      textAlign: TextAlign.center,
      maxLines: 2, // Limit text to 2 lines
    );
  }

  Widget buildSearchBox() {
    return Center(
      child: Container(
        width: 286,
        height: 49,
        child: TextField(
          decoration: InputDecoration(
            hintText: ' search',
            prefixIcon: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                      colors: MyColors.colorList, // Define gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: const Icon(Icons.search)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
    );
  }

  Widget buildHorizontalList(List<Widget> cards) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String location;

  DestinationCard({required this.imagePath, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final String price;

  HotelCard(
      {required this.imagePath, required this.hotelName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hotelName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}

class MyColors {
  static const List<Color> colorList = [Colors.blue, Colors.red];
}
