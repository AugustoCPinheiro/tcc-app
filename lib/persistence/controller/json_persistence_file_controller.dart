import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';

class JsonPersistenceFileController
    extends PersistenceFacade<MapEntry<String, dynamic>, String> {
  @override
  Future<MapEntry<String, dynamic>> find(String id) async {
    List<MapEntry<String, dynamic>> entries = await findAll();

    return entries.singleWhere((element) => element.key == id);
  }

  @override
  Future<List<MapEntry<String, dynamic>>> findAll() async {
    File file = await _localFile;
    String fileData = await file.readAsString();
    Map<String, dynamic> json = jsonDecode(fileData);

    return json.entries;
  }

  @override
  Future<void> update(String id, MapEntry record) async {}

  @override
  Future<void> saveAll(List<MapEntry> records) {}

  @override
  Future<void> save(MapEntry record) async {
    List<MapEntry<String, dynamic>> entries = await findAll();

    entries.add(record);
    File file = await _localFile;

    file.writeAsString(json.encode(Map.fromEntries(entries)));
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/patient.json");
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
