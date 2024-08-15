import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double p = MediaQuery.of(context).size.width / 20;

    final String firstName = 'homam';
    final String lastName = 'nasser';
    final String email = 'homam.nase.com';
    final String address = 'damascus';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: w,
                height: h - (h / 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h / 9),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('assets/images/1.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h / 50),
                defaultTitle(
                  title: '$firstName $lastName',
                  color: Colors.white,
                ),
                SizedBox(height: h / 20),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myIcon(icon: Icons.person),
                      SizedBox(width: 5),
                      defaultText(
                        text: 'First Name:',
                        color: Color.fromRGBO(1, 195, 175, 1),
                      ),
                      SizedBox(width: 10),
                      defaultText(text: '$firstName', color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myIcon(icon: Icons.person),
                      SizedBox(width: 5),
                      defaultText(
                        text: 'Last Name:',
                        color: Color.fromRGBO(1, 195, 175, 1),
                      ),
                      SizedBox(width: 10),
                      defaultText(text: '$lastName', color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myIcon(icon: Icons.email),
                      SizedBox(width: 5),
                      defaultText(
                        text: 'Email:',
                        color: Color.fromRGBO(1, 195, 175, 1),
                      ),
                      SizedBox(width: 10),
                      defaultText(text: email, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myIcon(icon: Icons.location_city),
                      SizedBox(width: 5),
                      defaultText(
                        text: 'Address:',
                        color: Color.fromRGBO(1, 195, 175, 1),
                      ),
                      SizedBox(width: 10),
                      defaultText(text: address, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myIcon(icon: Icons.date_range),
                      SizedBox(width: 5),
                      defaultText(
                        text: 'Created At:',
                        color: Color.fromRGBO(1, 195, 175, 1),
                      ),
                      SizedBox(width: 10),
                      defaultText(text: 'N/A', color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(p),
                  child: walletWidget(
                    amount: '1000',
                    currency: 'SYR',
                    color: Color.fromRGBO(1, 195, 175, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget myIcon({
  required IconData icon,
}) =>
    Padding(
      padding: EdgeInsets.only(left: 10),
      child: Icon(
        icon,
        color: Color.fromRGBO(1, 195, 175, 1),
        size: 18,
      ),
    );

Widget walletWidget({
  required String amount,
  required String currency,
  required Color color,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
          size: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallet Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$amount $currency',
              style: TextStyle(
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

Widget defaultButton({
  required double width,
  required void Function() onPressed,
  required double height,
  Color buttColor = Colors.black12,
  Color colortext = Colors.black12,
  double fontsize = 20,
  FontWeight fontWeight = FontWeight.w300,
  required String text,
}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: fontWeight,
                color: colortext,
                fontSize: fontsize,
              ),
            ),
          ),
        ));

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
