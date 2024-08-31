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
