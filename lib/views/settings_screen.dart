import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';
import 'package:tour_valve/cubits/settings_cubit/settings_cubit.dart';
import 'package:tour_valve/shared/components/buttons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            context.go('/login');
          } else if (state is SignOutFailure) {
            Toast.show('Something went wrong',
                duration: Toast.lengthShort, gravity: Toast.bottom);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
            child: Column(
              children: [
                defaultButton(
                    background: Colors.redAccent, text: 'ss', onPressed: () {}),
                defaultButton(
                    background: Colors.blueGrey, text: 'ss', onPressed: () {}),
                defaultButton(
                    background: Colors.purpleAccent,
                    text: 'ss',
                    onPressed: () {}),
                defaultButton(
                    background: Colors.amber,
                    text: 'Sign Out',
                    onPressed: () {
                      SettingsCubit.get(context).signOut();
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
