BIBI NAKIT – UPUTSTVO ZA AŽURIRANJE SAJTA
========================================

Ovo uputstvo je namenjeno za jednostavno menjanje proizvoda, slika, cena i opisa
na sajtu „Bibi nakit“. Sve izmene se rade direktno u fajlovima:

- index.html – početna stranica
- kolekcija.html – stranica sa celom ponudom
- products.json – podaci o proizvodima
- images/ – folder sa slikama


-------------------------------------------------------------
1. GDE SE NALAZE SLIKE?
-------------------------------------------------------------

Sve slike se nalaze u folderima:

images/
 ├─ hero/                – hero slika u uvodu
 │    └─ hero-nakit.jpg
 ├─ about/               – slika iz radionice
 │    └─ bibi-radionica.jpg
 └─ products/            – slike svih proizvoda
      ├─ narukvica-rozenkvarc.jpg
      ├─ ogrlica-ametist.jpg
      └─ mindjuse-mesecev-kamen.jpg


-------------------------------------------------------------
2. KAKO SE MENJA SLIKA PROIZVODA?
-------------------------------------------------------------

1. Fotografiju novog proizvoda snimi u folder:
   images/products/

2. Nazovi je nečim jednostavnim, npr:
   ogrlica-labradorit.jpg

3. U fajlu products.json pronađi odgovarajući proizvod i promeni polje „image“:

   "image": "images/products/ogrlica-labradorit.jpg"

4. Sačuvaj products.json  
   Slika će se automatski prikazati i na početnoj i u kolekciji.


-------------------------------------------------------------
3. KAKO SE MENJA CENA?
-------------------------------------------------------------

U products.json pronađi proizvod i promeni broj:

   "price": 2800

Možeš promeniti i valutu:

   "currency": "EUR"


-------------------------------------------------------------
4. KAKO SE MENJA OPIS PROIZVODA?
-------------------------------------------------------------

Menja se polje:

   "description": "Novi opis proizvoda."


-------------------------------------------------------------
5. KAKO SE DODAJE NOVI PROIZVOD?
-------------------------------------------------------------

U products.json, pre poslednje zatvorene uglaste zagrade ], dodati novi objekat:

{
  "id": "OG-07",
  "name": "Noćna tišina",
  "type": "ogrlica",
  "stone": "Labradorit",
  "price": 3600,
  "currency": "RSD",
  "available": true,
  "image": "images/products/ogrlica-labradorit.jpg",
  "description": "Ogrlica od labradorita sa plavo-zelenim odsjajem."
}

NAPOMENA:
- Svi objekti moraju biti razdvojeni zarezom, osim poslednjeg.
- Slika mora biti u images/products.


-------------------------------------------------------------
6. KAKO SE PROIZVOD OZNAČAVA KAO RASPRODAT?
-------------------------------------------------------------

Samo promeni:

   "available": false

Automatski će se pojaviti oznaka „Rasprodato“ i isključiti dugmad.


-------------------------------------------------------------
7. KAKO SE MENJAJU HERO SLIKA I SLIKA "O MENI"?
-------------------------------------------------------------

Hero slika:
   images/hero/hero-nakit.jpg

Slika „O meni“:
   images/about/bibi-radionica.jpg

Ako želiš nove slike, samo zameni postojeće novim fajlovima istog imena.


-------------------------------------------------------------
8. KAKO SE MENJAJU KONTAKT PODACI?
-------------------------------------------------------------

U oba HTML fajla (index.html i kolekcija.html), u delu „Kontakt“ promeniti brojeve:

WhatsApp: https://wa.me/38161355564
Viber:    https://viber.me/381611355564

Možeš promeniti i tekst poruke ako želiš.


-------------------------------------------------------------
9. KAKO SE SAJT AŽURIRA NA GITHUB-U?
-------------------------------------------------------------

1. Na računaru otvoriti folder projekta bibinakit
2. Dodati izmene:

   git add .

3. Napraviti commit:

   git commit -m "Ažurirani proizvodi"

4. Otpremiti na GitHub:

   git push origin main

Sajt se automatski osvežava za 10–30 sekundi.


-------------------------------------------------------------
10. VAŽNO – FAJLOVI KOJE NE TREBA DIRATI
-------------------------------------------------------------

index.html – ne menjati strukturu, samo ako treba tekst
kolekcija.html – isto
CSS je integrisan u HTML – ne dirati ako nije neophodno
products.json – samo uređivati proizvode


-------------------------------------------------------------
11. REZIME
-------------------------------------------------------------

Za sve promene u ponudi koristi se fajl products.json.
Slike se menjaju u images/products/.
Sajt se automatski ažurira nakon git push-a.

Ako nešto ne radi, najčešći uzrok je:
- greška u JSON-u (zarez viška, fali navodnik)
- slika nije u pravom folderu
- pogrešno ime slike

Uvek prvo proveri products.json.


=============================================================
KRAJ README.txt
=============================================================
