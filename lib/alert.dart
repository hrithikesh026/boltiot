import 'package:sprintf/sprintf.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

final BASE_URL = 'https://api.mailgun.net/v3/%s/messages';
class Sms{
  //will handle the sending sms
  var _account_sid, _auth_token;
  var _to_number, _from_number;
  TwilioFlutter twilioFlutter;

  Sms(this._account_sid,this._auth_token,this._to_number,this._from_number) {
    //Constructor
     this.twilioFlutter = new TwilioFlutter(accountSid: _account_sid,authToken: _auth_token,twilioNumber: _from_number);
  }

  Future<dynamic> send_sms({var message:null}){
    //send the sms using twilio client
    return twilioFlutter.sendSMS(toNumber: _to_number, messageBody: message);
  }
}
class Email{
  var auth;
  var url,from_email,to_email;
  var mailgun_domain_name;
  Email(var api_key,this.mailgun_domain_name,this.from_email,this.to_email){
    //constructor to imitialise the values
    this.url = sprintf(BASE_URL,mailgun_domain_name);
    this.auth = api_key;
  }


  Future<dynamic> send_email({String subject,String body}) async {
    return await http.post(
      url,
      headers:{HttpHeaders.authorizationHeader : auth},
      body: {
        "from": from_email,
        "to": to_email,
        "subject": subject,
        "text": body
      }
    );
  }
}