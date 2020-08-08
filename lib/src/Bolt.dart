import 'dart:core';
import 'requesting.dart';
import 'urls.dart';


class Bolt{
  var apiKey;
  var deviceId;





  Bolt(this.apiKey,this.deviceId){//constructor
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

        :returns:  Future<http.Response>
        :example: {"success": "1", "value": "1"}

    :rtype: JSON*/

    URLS url= new URLS('digitalWrite',[apiKey,pin,state,deviceId]);  //declaring a url object and calling its constructor by passing operation string the details as a list
    return requestFrom(url.finalUrl);
  }
  Future<dynamic> digitalRead(var pin) async {
    /*Reads the value from a specified digital pin.

        :param str: pin: number of the digital pin you want to read

        :returns:  Future<http.Response>
        :example: {"success": "1", "value": "1"}
        :rtype: JSON*/
    URLS url= new URLS('digitalRead',[apiKey,pin,deviceId] );
    return requestFrom(url.finalUrl);
  }
  Future<dynamic> analogWrite(var pin, var value) async {
    /*Writes an analog value to a pin.

    :param str pin: pin  number to write the value
        :param str value: between 0 (always off) and 255 (always on).

        :returns:  Future<http.Response>
        :example: {"success": "1", "value": "1"}

    :rtype: JSON*/
    URLS url= new URLS('analogWrite',[apiKey,pin,value,deviceId]);
    return await requestFrom(url.finalUrl);
  }

  Future<dynamic> analogRead(var pin) async {
    /*Reads the value from the specified analog pin.

        :param str pin: number of the digital pin you want to read

        :returns:  Future<http.Response>, value(0 to 254)
        :example: {"success": "1", "value": "130"}

        :rtype: Future<http.Response>
        */
    URLS url = new URLS('analogRead',[apiKey,pin,deviceId]);
    return requestFrom(url.finalUrl);
  }

  Future<dynamic> serialBegin(var baudRate) async {
    /*Sets the data rate in bits per second (baud) for serial data transmission.

        :param str baud_rate: speed: in bits per second (baud)

        :returns:  request status, serialBegin Status
        :example: {"success": "1", "value": "Success"}

        :rtype: JSON*/
    URLS url = new URLS('serialBegin',[apiKey,baudRate,deviceId]);
    return requestFrom(url.finalUrl);
  }

  Future<dynamic> serialWrite(var data) async {
    /*Writes the data to the serial port.

        :param str data: in bits per second (baud)

        :returns:  request status, serialWrite Status
        :example: {"success": "1", "value": "Serial write Successful"}

        :rtype: JSON*/
    URLS url = new URLS('serialWrite',[apiKey,data,deviceId]);
    return requestFrom(url.finalUrl);
  }
  Future<dynamic> serialRead(var charTill) async {
    /*Reads incoming serial data.

        :param str char_till: read the character upto specific index

        :returns:  request status, value
        :example: {"success": "1", "value": "inventrom"}

        :rtype: JSON*/
    URLS url = new URLS('serialRead',[apiKey,charTill,deviceId]);
    return requestFrom(url.finalUrl);
  }

  Future<dynamic> version() async {
    /*Check the Bolt hardware and firmware version

        :param None

        :returns:  request status, Bolt Hardware Version and Firmware Version
        :example: {"success": "1", "value": "{\"Bolt Hardware Version\":\"2\",
                                            \"Firmware Version\":\"1.0.1\"}"}

        :rtype: JSON*/
    URLS url = new URLS('version',[apiKey,deviceId]);
    return requestFrom(url.finalUrl);
  }

  Future<dynamic> restart() async {
    /*Restart the device

        :param None

        :returns:  request status, command status
        :example: {"success": "1", "value": "Restarted"}

        :rtype: JSON*/
    URLS url  =new URLS('restart',[apiKey,deviceId]);
    return requestFrom(url.finalUrl);
  }

  Future<dynamic> isAlive() async {
    /*Check the device status

        :param None

        :returns:  request status, device status: dead,alive
        :example: {"success": "1", "value": "alive"}

        :rtype: JSON*/
    URLS url = new URLS('isAlive', [apiKey,deviceId]);
    return requestFrom(url.finalUrl);
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

        :rtype: Future<http.Response>*/
    URLS url = new URLS('isOnline',[apiKey,deviceId]);
    return requestFrom(url.finalUrl);
  }
}