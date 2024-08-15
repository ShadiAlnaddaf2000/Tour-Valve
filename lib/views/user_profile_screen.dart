import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_valve/cubits/user_profile_cubit/user_profile_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
        if (state is UserProfileInitialState) {
          BlocProvider.of<UserProfileCubit>(context).submitUserProfile();
        }
        if (state is UserProfileLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is UserProfileSuccessState) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              Text('Name: ${state.user.firstName} ${state.user.lastName}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text('Email: ${state.user.email}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text('Address: ${state.user.address}',
                  style: const TextStyle(fontSize: 18)),
            ],
          );
        }
        if (state is UserProfileErrorState) {
          return ElevatedButton(
              onPressed: () {
                BlocProvider.of<UserProfileCubit>(context).submitUserProfile();
              },
              child: const Text('ree'));
        }
        return const Text('this is wrong');
      }),
    );
  }
}
