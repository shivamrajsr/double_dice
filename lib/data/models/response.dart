// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

ResponseModel responseFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {

  String quote;
  ResponseModel({
    required this.quote,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    quote: json["quote"] == null ? null : json["quote"],
  );

  Map<String, dynamic> toJson() => {
    "quote": quote == null ? null : quote,
  };
}
