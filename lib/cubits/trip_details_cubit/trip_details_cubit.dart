import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_valve/models/all_trip_model.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final Trip? trip;
  static TripDetailsCubit get(context) => BlocProvider.of(context);

  TripDetailsCubit(this.trip) : super(TripDetailsInitialState());

  void showTripActivity() {

  }
}
