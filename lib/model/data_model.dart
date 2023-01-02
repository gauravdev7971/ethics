
class DataModel {
  DataModel({
    required this.arrayValue,
    required this.pointerValue,
  });

  ArrayValue arrayValue;
  int pointerValue;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    arrayValue: ArrayValue.fromJson(json["array_value"]),
    pointerValue: json["pointer_value"],
  );

  Map<String, dynamic> toJson() => {
    "array_value": arrayValue.toJson(),
    "pointer_value": pointerValue,
  };
}

class ArrayValue {
  ArrayValue({
    required this.under,
    required this.over,
    required this.normal,
    required this.obes,
  });

  int under;
  int over;
  int normal;
  int obes;

  factory ArrayValue.fromJson(Map<String, dynamic> json) => ArrayValue(
    under: json["under"],
    over: json["over"],
    normal: json["normal"],
    obes: json["obes"],
  );

  Map<String, dynamic> toJson() => {
    "under": under,
    "over": over,
    "normal": normal,
    "obes": obes,
  };
}
