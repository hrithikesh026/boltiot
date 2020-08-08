

//Creating a key value store for all the urls and to generate appropriate url and
//return the final url using a getter
import 'dart:core';

import 'package:sprintf/sprintf.dart';

var urlList = {
  'digitalWrite' : '%s/digitalWrite?pin=%s&state=%s&deviceName=%s',
  'digitalRead' : '%s/digitalRead?pin=%s&deviceName=%s',
  'analogWrite' : '%s/analogWrite?pin=%s&value=%s&deviceName=%s',
  'analogRead' : '%s/analogRead?pin=%s&deviceName=%s',
  'serialBegin' : '%s/serialBegin?baud=%s&deviceName=%s',
  'serialWrite' : '%s/serialWrite?data=%s&deviceName%s',
  'serialRead' : '%s/serialRead?till=%s&deviceName=%s',
  'version' : '%s/version?&deviceName=%s',
  'restart' : '%s/restart?&deviceName=%s',
  'isAlive' : '%s/isAlive?&deviceName=%s',
  'isOnline' : '%s/isOnline?&deviceName=%s',
};
class URLS{
  static const BASE_URL = 'http://cloud.boltiot.com/remote/';
  var operation;

  List urlData;



  URLS(this.operation,this.urlData){
    //Constructor for initialising operation and urlData variable
  }

  String get finalUrl{//getter
    //generating final url and returning it to calling function using getter final_url
    return BASE_URL+sprintf(urlList[operation],urlData);
  }


}


