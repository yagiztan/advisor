import 'dart:convert';
import 'package:http/http.dart'as http;

var sozler ;
var cevirilensozler = "";

String? tavsiye= "Ne mutlu TÜRKÜM diyene";

Future<void> veriGetir() async{
  sozler = await http.get(Uri.parse("https://api.adviceslip.com/advice"));

  var cevap = jsonDecode(sozler.body);
  tavsiye = cevap["slip"]["advice"];
  print(tavsiye);
}

String secilendilial(String dil) {
  if (dil == "English") {
    return "en";
  } else if (dil == "Turkish") {
    return "tr";
  } else if (dil == "Deutsch") {
    return "du";
  }else if (dil == "Русский") {
    return "ru";
  }
  return "--";
}
