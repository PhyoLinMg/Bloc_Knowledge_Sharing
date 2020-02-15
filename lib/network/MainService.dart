import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class MainService{
  final http.Client httpClient;

  MainService({@required this.httpClient});

  Future<Periods> fetchPosts() async {
    const baseUrl="http://atantat.herokuapp.com";
    final periodUrl="$baseUrl/api/periods";
    final response=await this.httpClient.get(periodUrl,
        headers: {
          HttpHeaders.authorizationHeader:
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjIxMzk4MzljYmI0Yjg1N2JiNGQ5YjJiNDQ3OTYxOWFiMTcyNDNkM2JkNTM3YzdhZWUzNTVlYjgxODhiYjhkN2M3NWMyNjk0MmNkM2UwNmVhIn0.eyJhdWQiOiIxIiwianRpIjoiMjEzOTgzOWNiYjRiODU3YmI0ZDliMmI0NDc5NjE5YWIxNzI0M2QzYmQ1MzdjN2FlZTM1NWViODE4OGJiOGQ3Yzc1YzI2OTQyY2QzZTA2ZWEiLCJpYXQiOjE1ODA1Mzg1ODEsIm5iZiI6MTU4MDUzODU4MSwiZXhwIjoxNjEyMTYwOTgxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.c7doGx7NrkuwQKvb6_NND0LW02_yZ--qzunH-ymV8WKZeIFIPYiBlVE6GYNaSu1UQsKjI1p6OHHQhOJSS7vHl7xJgnBbWJaOVsJTEtms90nR6CIULx8-VMzX8de0pIBF005RhbIHbtjneYgMvDzb3HpdXCLAyi-f-Jy7ck1p5L0qCZ7RPDF_dy_AHdZTxKfH7d2nUpRQO0A4LHLVxB7wgJ3MOUlGGvEBPuFCrnc2ybTosXBc2etjnlWtMe0zAbu4rHAdCCcOd220FlFkQ5VKPk0KiqSAAms_-jOGT62MYi2W11iVljIOjvl4mwlGdeWJDPK-Xb9UEnc89J_rMF-GYX8SnsF48fpBdo9mDeXjnsZlSH-UAhGhEBjSVZLshhrULz7qXPbcHlS9rLH8qAjwlVbr9s2MorHy-NfBoXSNp819rW5zzOCyvJniQ9E18YtKxLAYYpf8rSHsLWIHZ6PlH91oTTrgmsVdttm15n2M65QciWM-lHpqUwR4lKzymUtJgsax5pzylq2hU_xgPOnKClIluIuGP-PH4l6URT3dhD-i-WULzOiNe6tfB0AsOukAE4Zysr7PEVFNSpV0EPvkNM3a1AF-BbXIjD-K1BykYFw_5PICP7sUyTA4gqcd1zKKFyRRkhqwWcKqqnftkW4AglidNlC1zOSSl2FjkEiP1Hs"
        }
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Periods.fromJsonMap(data);

    } else {
      throw Exception('error fetching posts');
    }
  }
}
