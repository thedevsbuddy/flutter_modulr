const String stub = """
class {MODULE}Model {
  {MODULE}Model({
    this.id,
  });

  int? id;

  {MODULE}Model copyWith({
    int? id,
  }) =>
      {MODULE}Model(
        id: id ?? this.id,
      );

  factory {MODULE}Model.fromJson(Map<String, dynamic> json) => {MODULE}Model(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
""";
