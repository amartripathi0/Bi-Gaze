import 'package:hive/hive.dart';
part 'proctor_model.g.dart';

@HiveType(typeId: 0)
class ProctorModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final Map<String, dynamic> audio;

  @HiveField(3)
  final Map<String, dynamic> object;

  const ProctorModel(this.id, this.object, this.audio, this.time);
}
