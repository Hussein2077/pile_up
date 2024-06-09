import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

navigateFromNotification(RemoteMessage message) {
  // Map<String, dynamic> data = jsonDecode(message.data['data']);

  String messageTypeDecode = jsonDecode(message.data['message-type']);

  switch (messageTypeDecode) {

  }
}