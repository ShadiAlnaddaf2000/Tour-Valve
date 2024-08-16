import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_valve/cubits/user_profile_cubit/user_profile_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double p = MediaQuery.of(context).size.width / 20;

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
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileInitialState) {
                BlocProvider.of<UserProfileCubit>(context).submitUserProfile();
              }
              if (state is UserProfileLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is UserProfileSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: h / 9),
                                child: const CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      AssetImage('assets/images/logo.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: h / 50),
                      defaultTitle(
                        title: '${state.user.firstName} ${state.user.lastName}',
                        color: Colors.white,
                      ),
                      SizedBox(height: h / 20),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myIcon(icon: Icons.person),
                            const SizedBox(width: 5),
                            defaultText(
                              text: 'First Name:',
                              color: const Color.fromRGBO(1, 195, 175, 1),
                            ),
                            const SizedBox(width: 10),
                            defaultText(
                                text: state.user.firstName,
                                color: Colors.white),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myIcon(icon: Icons.person),
                            const SizedBox(width: 5),
                            defaultText(
                              text: 'Last Name:',
                              color: const Color.fromRGBO(1, 195, 175, 1),
                            ),
                            const SizedBox(width: 10),
                            defaultText(
                                text: state.user.lastName, color: Colors.white),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myIcon(icon: Icons.email),
                            const SizedBox(width: 5),
                            defaultText(
                              text: 'Email:',
                              color: const Color.fromRGBO(1, 195, 175, 1),
                            ),
                            const SizedBox(width: 10),
                            defaultText(
                                text: state.user.email, color: Colors.white),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myIcon(icon: Icons.location_city),
                            const SizedBox(width: 5),
                            defaultText(
                              text: 'Address:',
                              color: const Color.fromRGBO(1, 195, 175, 1),
                            ),
                            const SizedBox(width: 10),
                            defaultText(
                                text: state.user.address, color: Colors.white),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            myIcon(icon: Icons.date_range),
                            const SizedBox(width: 5),
                            defaultText(
                              text: 'Created At:',
                              color: const Color.fromRGBO(1, 195, 175, 1),
                            ),
                            const SizedBox(width: 10),
                            defaultText(
                                text: state.user.createdAt.substring(0, 10),
                                color: Colors.white),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(p),
                        child: InkWell(
                          onTap: () {
                            context.push('/userFinance');
                          },
                          child: walletWidget(
                            amount: '${state.user.wallet}',
                            currency: 'SYR',
                            color: const Color.fromRGBO(1, 195, 175, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is UserProfileErrorState) {
                return const Text('Something went Wrong!');
              }
              return const SizedBox();
            },
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
      padding: const EdgeInsets.only(left: 10),
      child: Icon(
        icon,
        color: const Color.fromRGBO(1, 195, 175, 1),
        size: 18,
      ),
    );

Widget walletWidget({
  required String amount,
  required String currency,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(20),
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
              'Wallet Balance',
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
  Color textColor = Colors.black12,
  double fontSize = 20,
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
                color: textColor,
                fontSize: fontSize,
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
