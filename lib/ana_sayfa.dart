import 'package:dil_uygulamasi/units/verigetir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  var diller = ["English", "Turkish", "Deutsch", "Русский"];
  var sonucmetin = "";
  var secilendil = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn English Sentences"),
        centerTitle: true,
        leading: Icon(Icons.translate),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Advice : $tavsiye", textAlign: TextAlign.center,
                  style: GoogleFonts.lobster(fontSize: 20)),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Translate : $sonucmetin",textAlign: TextAlign.center,style: GoogleFonts.montserrat(fontSize: 25)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select Language"),
                SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  hint: Text("$secilendil"),
                  items: diller.map((String dropDownitem) {

                  return DropdownMenuItem(child: Text(dropDownitem),
                      value: dropDownitem);
                }).toList(), onChanged: (String? value) {
                  setState(() {
                    secilendil = value!;
                  });
                },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async {
                await veriGetir();
                await cevir(tavsiye.toString(), secilendilial(secilendil));
                setState(() {
                  tavsiye;
                });
              }, child: Text("Get beatiful sentence")),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }


  Future<void> cevir(String sonuc, String secilendil) async {
    GoogleTranslator cevirici = new GoogleTranslator();
    var cevirilensonuc = await cevirici.translate(
        tavsiye.toString(), from: "auto", to: secilendil);

    setState(() {
      sonucmetin = cevirilensonuc.text.toString();
    });
  }


}
