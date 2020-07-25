import 'dart:core';
import 'package:boltiot/requesting.dart';
import 'package:boltiot/urls.dart';


class Bolt{
  var api_key;
  var device_id;





  Bolt(this.api_key,this.device_id){//constructor
    /*
    Creating a class construcor.

        :param str api_key: api key to authenticate user
        :param str device_id: password to

        :returns: None
    :returntype: None
    */
  }

  Future<dynamic> digitalWrite(var pin,var state) async {
    /*Reads the value from a specified digital pin.

    :param str: pin: number of the digital pin you want to read

        :returns:  request status, value
        :example: {"success": "1", "value": "1"}

    :rtype: JSON*/

    urls URL= new urls('digitalWrite',[api_key,pin,state,device_id]);  //declaring a url object and calling its constructor by passing operation string the details as a list
    return requestFrom(URL.final_url);
  }
  Future<dynamic> digitalRead(var pin) async {
    /*Reads the value from a specified digital pin.

        :param str: pin: number of the digital pin you want to read

        :returns:  request status, value
        :example: {"success": "1", "value": "1"}
        :rtype: JSON*/
    urls URL= new urls('digitalRead',[api_key,pin,device_id] );
    return requestFrom(URL.final_url);
  }
  Future<dynamic> analogWrite(var pin, var value) async {
    /*Writes an analog value to a pin.

    :param str pin: pin  number to write the value
        :param str value: between 0 (always off) and 255 (always on).

        :returns:  request status, command status
        :example: {"success": "1", "value": "1"}

    :rtype: JSON*/
    urls URL= new urls('analogWrite',[api_key,pin,value,device_id]);
    return await requestFrom(URL.final_url);
  }

  Future<dynamic> analogRead(var pin) async {
    /*Reads the value from the specified analog pin.

        :param str pin: number of the digital pin you want to read

        :returns:  request status, value(0 to 254)
        :example: {"success": "1", "value": "130"}

        :rtype: JSON*/
    urls URL = new urls('analogRead',[api_key,pin,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> serialBegin(var baud_rate) async {
    /*Sets the data rate in bits per second (baud) for serial data transmission.

        :param str baud_rate: speed: in bits per second (baud)

        :returns:  request status, serialBegin Status
        :example: {"success": "1", "value": "Success"}

        :rtype: JSON*/
    urls URL = new urls('serialBegin',[api_key,baud_rate,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> serialWrite(var data) async {
    /*Writes the data to the serial port.

        :param str data: in bits per second (baud)

        :returns:  request status, serialWrite Status
        :example: {"success": "1", "value": "Serial write Successful"}

        :rtype: JSON*/
    urls URL = new urls('serialWrite',[api_key,data,device_id]);
    return requestFrom(URL.final_url);
  }
  Future<dynamic> serialRead(var char_till) async {
    /*Reads incoming serial data.

        :param str char_till: read the character upto specific index

        :returns:  request status, value
        :example: {"success": "1", "value": "inventrom"}

        :rtype: JSON*/
    urls URL = new urls('serialRead',[api_key,char_till,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> version() async {
    /*Check the Bolt hardware and firmware version

        :param None

        :returns:  request status, Bolt Hardware Version and Firmware Version
        :example: {"success": "1", "value": "{\"Bolt Hardware Version\":\"2\",
                                            \"Firmware Version\":\"1.0.1\"}"}

        :rtype: JSON*/
    urls URL = new urls('version',[api_key,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> restart() async {
    /*Restart the device

        :param None

        :returns:  request status, command status
        :example: {"success": "1", "value": "Restarted"}

        :rtype: JSON*/
    urls URL  =new urls('restart',[api_key,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> isAlive() async {
    /*Check the device status

        :param None

        :returns:  request status, device status: dead,alive
        :example: {"success": "1", "value": "alive"}

        :rtype: JSON*/
    urls URL = new urls('isAlive', [api_key,device_id]);
    return requestFrom(URL.final_url);
  }

  Future<dynamic> isOnline() {
    /*The command tells the user about the status of the device,
        if it is Online/Offline along with time when status changed.

        :param None
        :returns : {success: status of the request(1/0),
                    value: device status (online/offline),
                    time: the time when the device was online/offline respectively
                          (format: day yyyy-mm-dd hh:mm:ss TZ)}
        :example: {"success": "1", "value": "online", "time":"Sun 2018-05-06 08:14:43 UTC"}

        :rtype: JSON*/
    urls URL = new urls('isOnline',[api_key,device_id]);
    return requestFrom(URL.final_url);
  }
}