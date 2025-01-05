// lib/logic/cubits/wearable_cubit/wearable_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';
import 'package:interview_app/features/wearable/repo/wearable_repository.dart';
import 'wearable_state.dart';

class WearableCubit extends Cubit<WearableState> {
  final WearableRepository wearableRepository;

  WearableCubit(this.wearableRepository) : super(const WearableState());

  /// Loads wearable data from the repository.
  Future<void> loadWearableData() async {
    emit(state.copyWith(status: WearableStatus.loading));
    try {
      await wearableRepository.loadWearableData();
      final data = wearableRepository.getLatestWearableData();
      emit(state.copyWith(status: WearableStatus.success, wearableData: data));
    } catch (e) {
      emit(state.copyWith(status: WearableStatus.failure, errorMessage: e.toString()));
    }
  }

  /// Updates wearable data.
  Future<void> updateWearableData(WearableDataModel data) async {
    emit(state.copyWith(status: WearableStatus.loading));
    try {
      await wearableRepository.updateWearableData(data);
      final updatedData = wearableRepository.getLatestWearableData();
      emit(state.copyWith(status: WearableStatus.success, wearableData: updatedData));
    } catch (e) {
      emit(state.copyWith(status: WearableStatus.failure, errorMessage: e.toString()));
    }
  }
}