import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/participant.dart';

final participantsProvider =
    StateNotifierProvider<WaitingViewmodel, List<Participant>>((ref) {
  return WaitingViewmodel();
});

class WaitingViewmodel extends StateNotifier<List<Participant>> {
  WaitingViewmodel() : super([]);

  void addParticipant(Participant participant) {
    state = [...state, participant];
  }

  void removeParticipant(String id) {
    state = state.where((user) => user.user_id != id).toList();
  }
}
