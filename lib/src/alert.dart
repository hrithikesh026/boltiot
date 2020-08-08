import 'package:sprintf/sprintf.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

final baseUrl = 'https://api.mailgun.net/v3/%s/messages';
class Sms{
  //will handle the sending sms
  var _accountSid, _authToken;
  var _toNumber, _fromNumber;
  TwilioFlutter twilioFlutter;

  Sms(this._accountSid,this._authToken,this._toNumber,this._fromNumber) {
    //Constructor
     this.twilioFlutter = new TwilioFlutter(accountSid: _accountSid,authToken: _authToken,twilioNumber: _fromNumber);
  }

  Future<dynamic> sendSms({var message}){
    //send the sms using twilio client
    return twilioFlutter.sendSMS(toNumber: _toNumber, messageBody: message);
  }
}
class Email{
  var auth;
  var url,fromEmail,toEmail;
  var mailgunDomainName;
  Email(var apiKey,this.mailgunDomainName,this.fromEmail,this.toEmail){
    //constructor to imitialise the values
    this.url = sprintf(baseUrl,mailgunDomainName);
    this.auth = apiKey;
  }


  Future<dynamic> sendEmail({String subject,String body}) async {
    return await http.post(
      url,
      headers:{HttpHeaders.authorizationHeader : auth},
      body: {
        "from": fromEmail,
        "to": toEmail,
        "subject": subject,
        "text": body
      }
    );
  }
}