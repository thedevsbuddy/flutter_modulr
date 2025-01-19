import 'package:get/get.dart';

import 'database_connection.dart';

class Database extends DatabaseConnection {
  Database(String filename) : super(filename);

  // Query builder - Add a where condition
  Database where(Map<String, dynamic> conditions) {
    whereClause = conditions;
    return this;
  }

  // Get data based on the query
  Future<List<Map<String, dynamic>>> get() async {
    await loadData();
    return await filteredData();
  }

  // Delete records based on where condition
  Future<Map<String, dynamic>?> first() async {
    await loadData();
    List<Map<String, dynamic>> _data = await filteredData();
    return _data.firstWhereOrNull((record) => _data.contains(record));
  }

  // Delete records based on where condition
  Future<void> delete() async {
    await loadData();
    List<Map<String, dynamic>> _data = await filteredData();
    _data.removeWhere((record) => _data.contains(record));
    await saveFile(_data);
  }

  // Add a new record
  Future<List<Map<String, dynamic>>> store(Map<String, dynamic> record) async {
    await loadData();
    List<Map<String, dynamic>> _data = await filteredData();
    _data.add(record);
    await saveFile(_data);
    return _data;
  }

  // Update records based on where condition
  Future<void> update(Map<String, dynamic> data) async {
    List<Map<String, dynamic>> _data = await loadData();
    for (var record in _data) {
      if (whereClause != null && (await filteredData()).contains(record)) {
        record.addAll(data);
      }
    }
    await saveFile(_data);
  }
}
