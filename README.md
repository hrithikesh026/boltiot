# boltiot

A new Flutter package for interacting with boltiot cloud .
To use this package in your flutter project, add boltiot: as a dependency in your pubspec.yaml file
and import the package by typing
import 'package:boltiot/boltiot.dart';

You can use this package just like the boltiot's python package.

## Getting Started :- Creating a Bolt object
```
Bolt myBolt ;
```

## Intialise API_KEY and DEVICE_ID by calling the Bolt contructor
```
myBolt = new Bolt('API_KEY','DEVICE_ID');
```

## Using myBolt object to interact with the Bolt wifi module
If a passing an parameter to a Bolt function, always pass a String.
Every function returns a Future<http.Response>
```
var response = await myBolt.isOnline();
var response = await myBolt.digitalWrite('PIN','STATE');
```

## To get the response data from http.Response object, use body getter of http.Response as shown below
```
http.Response response = await myBolt.isOnline();
print(response.body);
```
OUTPUT:- {"value":"Device is offline","success":0}


# Sending Alert SMS using Twilio
## Create a Sms object;
```
Sms sms;
```
## Initialising the Sms object with Sms Constructor
```
sms = new Sms('account_sid','auth_token','to_number','from_number');
```
## Sending sms
```
sms.sendSms(message:'This is an alert message');
```

# Sending Email using Mailgun API
## Create Email object
```
Email email;
```
## Initialise the Email object with Email Constructor
```
email = new Email('api_key','mailgun_domain_name','from_email','to_email');
```
## Sending Email
```
email.sendEmail(subject:'This is subject of the Email',body:'This is body of the Email');
```