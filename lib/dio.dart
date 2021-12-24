import 'package:dio/dio.dart';

const token = '_82FHvyMwRf_7cnr3x_S';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://git.monitorsoft.ru/api/v4/',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + token,
    },
  ),
);