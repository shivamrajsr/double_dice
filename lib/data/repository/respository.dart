
import 'dart:convert';

import 'package:double_dice/data/models/response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class repository{



  Future <ResponseModel> getresponse() async{
    var url = Uri.parse('https://api.kanye.rest/');
    var response = await http.get(url);
    return ResponseModel.fromJson(jsonDecode(response.body));
  }





}