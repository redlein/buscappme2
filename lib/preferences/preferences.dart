import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _img = '';
  static String _name = '';
  static String _lastname = '';
  static String _city = '';
  static String _country = '';
  static int _gender = 1;
  static String _number = '';
  static String _email = '';
  static String _img2 = '';
  static String _numberDocument = '';
  static bool _theme = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GEt & SET

  //Image
  static String get img {
    return _prefs.getString('img') ?? _img;
  }

  static set img(String img) {
    _img = img;
    _prefs.setString('img', img);
  }

  //Name
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }
  //

  //Lastname
  static String get lastname {
    return _prefs.getString('lastname') ?? _lastname;
  }

  static set lastname(String lastname) {
    _lastname = lastname;
    _prefs.setString('lastname', lastname);
  }
  //

  //City
  static String get city {
    return _prefs.getString('city') ?? _city;
  }

  static set city(String city) {
    _city = city;
    _prefs.setString('city', city);
  }
  //

  //Country
  static String get country {
    return _prefs.getString('country') ?? _country;
  }

  static set country(String country) {
    _country = country;
    _prefs.setString('country', country);
  }
  //

  //Gender
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }

  //Number
  static String get number {
    return _prefs.getString('number') ?? _number;
  }

  static set number(String number) {
    _number = number;
    _prefs.setString('number', number);
  }

  //Email
  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  //Image
  static String get img2 {
    return _prefs.getString('img2') ?? _img2;
  }

  static set img2(String img2) {
    _img2 = img2;
    _prefs.setString('img2', img2);
  }

  //Number document
  static String get numberDocument {
    return _prefs.getString('numberDocument') ?? _numberDocument;
  }

  static set numberDocument(String numberDocument) {
    _numberDocument = numberDocument;
    _prefs.setString('numberDocument', numberDocument);
  }

  // static late SharedPreferences _prefs;

  // static bool _theme = false;

  // static Future init() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }
}
