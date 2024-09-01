import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/participant.freezed.dart';
part 'generated/participant.g.dart';

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String user_id,
    required String name,
    required String iconUrl,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

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
