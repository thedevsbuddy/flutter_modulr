import 'package:get/get.dart';

import 'database_connection.dart';

class Database extends DatabaseConnection {
  Database(String filename) : super(filename);

  /// Retrieves all items from the database.
  ///
  /// This method loads the data from the file and returns the entire list of data items.
  /// It is useful for fetching all records from the database.
  ///
  /// @return The list of all data items in the database, or null if the data could not be loaded.
  Future<List<Map<String, dynamic>>?> findMany() async {
    await loadFile();
    return data;
  }

  /// Retrieves a single item from the database based on the provided identifier and value.
  ///
  /// This method loads the data from the file and returns the first item that matches the
  /// specified identifier and value. It is useful for fetching a specific record from the database.
  ///
  /// @param identifier The key to use for the lookup (e.g. 'id', 'name', etc.)
  /// @param value The value to match against the identifier
  /// @return The first item that matches the identifier and value, or null if not found
  Future<Map<String, dynamic>?> findOne(Map<String, dynamic> args) async {
    await loadFile();

    return data?.firstWhereOrNull((item) {
      bool matches = false;
      for (String key in args.keys) {
        matches = item[key] == args[key];
      }
      return matches;
    });
  }

  /// Retrieves the first item from the database.
  ///
  /// This method loads the data from the file and returns the first item in the data list,
  /// or null if the data list is empty. It is useful for fetching the first record from the database.
  ///
  /// @return The first item in the database, or null if the data list is empty.
  Future<Map<String, dynamic>?> first() async {
    await loadFile();
    return data?.firstOrNull;
  }

  /// Stores a new item in the database.
  ///
  /// This method loads the data from the file, adds the new data item to the list,
  /// and then saves the updated data back to the file. It is useful for adding
  /// a new record to the database.
  ///
  /// @param newData The new data item to be added to the database.
  /// @return The updated list of data items in the database.
  Future<List<Map<String, dynamic>>?> store(dynamic newData) async {
    await loadFile();
    data!.add(newData);
    await saveFile(data!);
    return data;
  }

  /// Removes a single item from the database based on the provided identifier and value.
  ///
  /// This method loads the data from the file, removes the first item that matches the
  /// specified identifier and value, and then saves the updated data back to the file.
  /// It is useful for deleting a specific record from the database.
  ///
  /// @param identifier The key to use for the lookup (e.g. 'id', 'name', etc.)
  /// @param value The value to match against the identifier
  /// @return The updated list of data items in the database.
  Future<List<Map<String, dynamic>>?> destroy(String identifier, dynamic value) async {
    await loadFile();
    data!.removeWhere((item) => item[identifier] == value);
    await saveFile(data!);
    return data;
  }
}
