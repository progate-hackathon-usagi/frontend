import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/participant.dart';

class ParticipantsNotifier extends StateNotifier<List<Participant>> {
  ParticipantsNotifier() : super([]);

  void addParticipant(Participant participant) {
    state = [...state, participant];
  }

  void removeParticipant(String id) {
    state = state.where((user) => user.user_id != id).toList();
  }
}

final participantsProvider =
    StateNotifierProvider<ParticipantsNotifier, List<Participant>>((ref) {
  return ParticipantsNotifier();
});
