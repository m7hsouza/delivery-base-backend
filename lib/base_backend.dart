import 'dart:async';

import 'package:mysql1/mysql1.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void init() async {
  final connectionSettings = ConnectionSettings(
    host: '0.0.0.0',
    port: 3306,
    user: 'root',
    password: 'root',
    db: 'delivery',
  );

  final conn = await MySqlConnection.connect(connectionSettings);

  final sql = 'SELECT * FROM tbl_usuarios';

  final result = await conn.query(sql);

  print(result);

  await serve(_handler, '0.0.0.0', 2001);

  conn.close();
}

FutureOr<Response> _handler(Request request) {
  return Response.ok({
    'message': 'Hello Word!',
  });
}
