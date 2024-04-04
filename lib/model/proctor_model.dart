import 'package:hive/hive.dart';
part 'proctor_model.g.dart';

@HiveType(typeId: 0)
class ProctorModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final List<String> time;

  @HiveField(3)
  final List<Map<String, dynamic>> audio;

  @HiveField(4)
  final List<Map<String, dynamic>> object;

  const ProctorModel(this.id, this.date, this.time, this.audio, this.object);
}
