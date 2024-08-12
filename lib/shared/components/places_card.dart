import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../cubits/main_screen_cubit/main_screen_cubit.dart';

Widget placesCardItem(item, context, MainScreenState state) => Card(
      child: SizedBox(
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
                  '${item.imgePath}',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${item.location}',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );

Widget placesCardBuilder(items, context, MainScreenState state) =>
    ConditionalBuilder(
        condition: state is! MainScreenLoadingState && items != null,
        builder: (context) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                placesCardItem(items[index], context, state);
                return null;
              },
              itemCount: items.length,
            ),
        fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ));
